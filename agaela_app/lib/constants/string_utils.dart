extension StringUtils on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidDni {
    final emailRegExp = RegExp(r'^[0-9]{8}[TRWAGMYFPDXBNJZSQVHLCKE]$');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'^[a-zA-Z0-9]{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidString {
    final phoneRegExp = RegExp(r'^[a-zA-Z]+$');
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r'^\d{9}$');
    return phoneRegExp.hasMatch(this);
  }
}
