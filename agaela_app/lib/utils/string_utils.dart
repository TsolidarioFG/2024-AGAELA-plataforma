extension StringUtils on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidDni {
    final dniRegExp = RegExp(r'^[0-9]{8}[TRWAGMYFPDXBNJZSQVHLCKE]$');
    return dniRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'^[a-zA-Z0-9]{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r'^\d{9}$');
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidIban {
    final ibanRegExp =
        RegExp(r'^(?:[A-Z]{2}\d{2}[0-9]{4}[0-9]{4}[0-9]{4}[0-9]{1,12})$');
    return ibanRegExp.hasMatch(this);
  }

  bool get isValidNumber {
    final numberRegExp = RegExp(r'^[0-9]+$');
    return numberRegExp.hasMatch(this);
  }

  bool get isValidPostalCode {
    final postalCodeRegExp = RegExp(r'^(?:0[1-9]|[1-4][0-9]|5[0-2])[0-9]{3}$');
    return postalCodeRegExp.hasMatch(this);
  }

  bool get isValidPercentage {
    final percentageRegExp = RegExp(r'^(?:\d{1,3}(?:(?:\.\d{1,2})?)?)$');
    return percentageRegExp.hasMatch(this);
  }
}
