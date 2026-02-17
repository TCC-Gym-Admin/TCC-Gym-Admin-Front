import 'package:flutter/services.dart';

class CustomMoneyFormatter extends TextInputFormatter {
  CustomMoneyFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String cleanText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (cleanText.isEmpty) {
      return newValue.copyWith(
        text: 'R\$ 0,00',
        selection: TextSelection.collapsed(offset: 4),
      );
    }

    while (cleanText.length < 3) {
      cleanText = '0$cleanText';
    }

    String reais = cleanText.substring(0, cleanText.length - 2);
    String centavos = cleanText.substring(cleanText.length - 2);

    String reaisFormatados = '';
    for (var i = 0; i < reais.length; i++) {
      if (i > 0 && (reais.length - i) % 3 == 0) {
        reaisFormatados += '.';
      }
      reaisFormatados += reais[i];
    }

    if (reaisFormatados.startsWith('0') && reaisFormatados.length > 1) {
      reaisFormatados = reaisFormatados.replaceFirst('0', '');
    }

    String newText = 'R\$ $reaisFormatados,$centavos';

    int cursorPosition = _calculateCursorPosition(oldValue, newValue, newText);
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }

  int _calculateCursorPosition(
    TextEditingValue oldValue,
    TextEditingValue newValue,
    String formattedText,
  ) {
    if (newValue.selection.baseOffset >= newValue.text.length) {
      return formattedText.length;
    }

    if (newValue.selection.baseOffset <= 0) {
      return 3;
    }

    int digitsBeforeCursor = 0;

    for (
      var i = 0;
      i < newValue.selection.baseOffset && i < newValue.text.length;
      i++
    ) {
      if (RegExp(r'[0-9]').hasMatch(newValue.text[i])) {
        digitsBeforeCursor++;
      }
      if (digitsBeforeCursor == 0) {
        return 3;
      }
      int digitCounted = 0;
      for (int i = 0; i < formattedText.length; i++) {
        if (RegExp(r'[0-9]').hasMatch(formattedText[i])) {
          digitCounted++;
          if (digitCounted >= digitsBeforeCursor) {
            return i + 1;
          }
        }
      }
    }

    return 0;
  }
}
