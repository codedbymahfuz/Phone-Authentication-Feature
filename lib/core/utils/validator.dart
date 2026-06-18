class Validatior {
  static final RegExp mobileRegExp = RegExp(r'^(?:\+880|880|0)?1[3-9]\d{8}$');

  static String? validNumberCheck({
    String? value,
    required String nullNumberError,
    required String validNumberError,
  }) {
    if (value == null || value.trim().isEmpty) {
      return nullNumberError;
    }
    if (!mobileRegExp.hasMatch(value)) {
      return validNumberError;
    }
    return null;
  }
  
  static String? validPinPutCheck (
    {
      String? value,
      required String nullPinputError,
      required String sixDigitError,
    }) {
     
     if(value == null || value.trim().isEmpty) {
        return nullPinputError;
     } 
       else if(value.length != 6) {
         return sixDigitError;
       }
      return null;
  }

}
