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
}
