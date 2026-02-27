class CustomCleanFormatter {
  static String cleanDocument(String value) {
    return value.replaceAll(RegExp(r'[^0-9]'), '');
  }

  static double cleanMoney(String value) {
    String somenteNumeros = value.replaceAll(RegExp(r'[^0-9]'), '');
    return double.parse(somenteNumeros) / 100;
  }
}
