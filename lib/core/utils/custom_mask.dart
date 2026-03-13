import 'package:intl/intl.dart';

class CustomMask {
  static String realMask(double value) {
    final mask = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return mask.format(value);
  }
}
