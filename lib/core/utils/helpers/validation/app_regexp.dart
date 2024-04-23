class AppRegExp {
  static int minPasswordLength = 6;

  // Authentication
  static bool isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    // return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/-=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isNameValid(String name) {
    return RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$").hasMatch(name);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r"^(?:[+])?[0-9]{10}$").hasMatch(phoneNumber);
  }

  static bool isOTPValid(String otp) {
    return RegExp(r"^[0-9]{6}$").hasMatch(otp);
  }

  static bool isPasswordValid(String password) {
    return _hasLowerCase(password) &&
        _hasUpperCase(password) &&
        _hasNumber(password) &&
        _hasSpecialCharacters(password) &&
        passwordHasMinLength(password);
  }

  static bool _hasLowerCase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  static bool _hasUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  static bool _hasNumber(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  static bool _hasSpecialCharacters(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  static bool passwordHasMinLength(String password) {
    return password.length >= minPasswordLength;
  }

  // Others
  static bool isCardCVVValid(String cardCVV) {
    return RegExp(r"^[0-9]{3,4}$").hasMatch(cardCVV);
  }
}
