class Validatior {
  static final RegExp mobileRegExp = RegExp(r'^(?:\+880|880|0)?1[3-9]\d{8}$');

  static String? validNumber({
    String? value,
    required String nullNumber,
    required String validNumberError,
  }) {
    if (value == null || value.trim().isEmpty) {
      return nullNumber;
    }
    if (!mobileRegExp.hasMatch(value)) {
      return validNumberError;
    }
    return null;
  }
}
