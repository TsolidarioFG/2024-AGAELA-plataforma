import 'dart:collection';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:agaela_app/features/edit_profile/models/province.dart';
import 'package:intl/intl.dart';

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
  final Country _country;
  final Province _province;
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

  DateTime get birthDate => _birthDate;

  UnmodifiableListView<int> get telephoneNumbers =>
      UnmodifiableListView(_telephoneNumbers);

  UnmodifiableListView<String> get emails => UnmodifiableListView(_emails);

  String get iban => _iban;

  int get feeAmount => _feeAmount;

  bool get acceptSendNews => _acceptSendNews;

  bool get acceptLegalNotice => _acceptLegalNotice;

  Country get country => _country;

  Province get province => _province;

  String get city => _city;

  String get postalCode => _postalCode;

  String get address => _address;

  String get profession => _profession;

  factory UserProfileInformation.fromJson(Map<String, dynamic> json) {
    const minimumCountryNotSpainId = 8000;
    String name = json['nombre'] as String? ?? '';
    String lastName1 = json['apellido1'] as String? ?? '';
    String lastName2 = json['apellido2'] as String? ?? '';
    String dni = json['dni'] as String? ?? '';
    DateTime? birthDate = DateTime.parse(
        json['fechaNacimiento'] as String? ?? DateTime.now().toIso8601String());
    Iterable telephones = json['telefonos'] ?? [];
    List<int> telephoneNumbers = List<int>.from(
        telephones.map((telephone) => int.parse(telephone as String)));
    Iterable emailsIterable = json['emails'] ?? [];
    List<String> emails =
        List<String>.from(emailsIterable.map((email) => email as String));
    String iban = json['iban'] as String? ?? '';
    String feeAmountString = json['cuotaSocio']['importe'] as String? ?? '0.0';
    double feeAmountDouble = double.parse(feeAmountString);
    int feeAmount = feeAmountDouble.round();
    bool acceptSendNews = json['aceptaPublicidad'] as bool? ?? false;
    bool acceptLegalNotice = json['aceptaAvisoLegal'] as bool? ?? true;
    int ubicationId = int.parse(json['ubicacion']['id'] as String);
    String ubicationName = json['ubicacion']['nombre'] as String;
    int ubicationParentId = int.parse(json['ubicacion']['idPadre'] as String);
    Province province = Province(ubicationId, ubicationName, ubicationParentId);
    String city = json['ciudad'] as String? ?? '';
    String postalCode = json['codigoPostal'] as String? ?? '';
    String address = json['direccion'] as String? ?? '';
    String? profession = json['profesion'] as String? ?? '';
    return UserProfileInformation(
        name,
        lastName1,
        lastName2,
        dni,
        birthDate,
        telephoneNumbers,
        emails,
        iban,
        feeAmount,
        acceptSendNews,
        acceptLegalNotice,
        ubicationId >= minimumCountryNotSpainId
            ? Country(ubicationId, ubicationName)
            : Country(spainCountryCode, 'España'),
        province,
        city,
        postalCode,
        address,
        profession);
  }

  Map<String, dynamic> toJson() => {
        'nombre': name,
        'apellido1': lastName1,
        'apellido2': lastName2,
        'fechaNacimiento': DateFormat('dd/MM/yyyy').format(birthDate),
        'dni': dni,
        'profesion': profession,
        'idUbicacion': country.countryCode != spainCountryCode
            ? country.countryCode
            : province.provinceCode,
        'direccion': address,
        'codigoPostal': postalCode,
        'ciudad': city,
        'iban': iban,
        'emails': emails,
        'telefonos': telephoneNumbers,
        'importeSocioCuota': feeAmount,
        'aceptaAvisoLegal': acceptLegalNotice ? 1 : 0,
        'aceptaPublicidad': acceptSendNews ? 1 : 0
      };
}
