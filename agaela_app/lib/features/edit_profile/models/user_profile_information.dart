import 'dart:collection';

class UserProfileInformation {
  final String _name;
  final String _lastName1;
  final String _lastName2;
  final String _dni;
  final DateTime _birthDate;
  final List<int> _telephoneNumbers;
  final List<String> _emails;
  final String _iban;
  final int _feeAmount;
  final bool _acceptSendNews;
  final bool _acceptLegalNotice;
  final String _country;
  final String _province;
  final String _city;
  final String _postalCode;
  final String _address;
  final String _profession;

  const UserProfileInformation(
      this._name,
      this._lastName1,
      this._lastName2,
      this._dni,
      this._birthDate,
      this._telephoneNumbers,
      this._emails,
      this._iban,
      this._feeAmount,
      this._acceptSendNews,
      this._acceptLegalNotice,
      this._country,
      this._province,
      this._city,
      this._postalCode,
      this._address,
      this._profession);

  String get name => _name;

  String get lastName1 => _lastName1;

  String get lastName2 => _lastName2;

  String get dni => _dni;

  DateTime get bithDate => _birthDate;

  UnmodifiableListView<int> get telephoneNumbers =>
      UnmodifiableListView(_telephoneNumbers);

  UnmodifiableListView<String> get emails => UnmodifiableListView(_emails);

  String get iban => _iban;

  int get feeAmount => _feeAmount;

  bool get acceptSendNews => _acceptSendNews;

  bool get acceptLegalNotice => _acceptLegalNotice;

  String get country => _country;

  String get province => _province;

  String get city => _city;

  String get postalCode => _postalCode;

  String get address => _address;

  String get profession => _profession;
}
