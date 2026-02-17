import 'package:flutter/services.dart';

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove tudo que não for número
    String cleanText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Limita a 11 dígitos
    if (cleanText.length > 11) {
      cleanText = cleanText.substring(0, 11);
    }

    String formattedText = _formatCpf(cleanText);

    int cursorPosition = _calculateCursorPosition(newValue, formattedText);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }

  String _formatCpf(String text) {
    if (text.length <= 3) return text;
    if (text.length <= 6) {
      return '${text.substring(0, 3)}.${text.substring(3)}';
    }
    if (text.length <= 9) {
      return '${text.substring(0, 3)}.'
          '${text.substring(3, 6)}.'
          '${text.substring(6)}';
    }
    return '${text.substring(0, 3)}.'
        '${text.substring(3, 6)}.'
        '${text.substring(6, 9)}-'
        '${text.substring(9)}';
  }

  int _calculateCursorPosition(
    TextEditingValue newValue,
    String formattedText,
  ) {
    int cursorPosition = newValue.selection.baseOffset;

    if (cursorPosition <= 0) return 0;
    if (cursorPosition >= newValue.text.length) {
      return formattedText.length;
    }

    // Conta quantos dígitos existem antes do cursor
    int digitsBeforeCursor = 0;
    for (int i = 0; i < cursorPosition; i++) {
      if (RegExp(r'[0-9]').hasMatch(newValue.text[i])) {
        digitsBeforeCursor++;
      }
    }

    // Agora encontra a posição equivalente no texto formatado
    int digitCount = 0;
    for (int i = 0; i < formattedText.length; i++) {
      if (RegExp(r'[0-9]').hasMatch(formattedText[i])) {
        digitCount++;
        if (digitCount == digitsBeforeCursor) {
          return i + 1;
        }
      }
    }

    return formattedText.length;
  }
}
