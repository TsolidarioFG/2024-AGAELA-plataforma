import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  test('User profile information from json method works correctly', () {
    String name = 'test';
    String lastName1 = 'test2';
    String lastName2 = 'test3';
    String dni = '111111111A';
    DateTime birthDate = DateTime.now();
    List<int> telephones = [];
    List<String> emails = [];
    String iban = '';
    String feeAmount = '10.2';
    String feeAmountRounded = '10';
    bool acceptSendNews = false;
    bool acceptLegalNotice = true;
    String ubicationId = '2';
    String ubicationName = 'A Coruña';
    String ubicationParentId = '1';
    String city = 'A Coruña';
    String postalCode = '11111';
    String address = '';
    String profession = '';
    Map<String, dynamic> json = {
      'nombre': name,
      'apellido1': lastName1,
      'apellido2': lastName2,
      'dni': dni,
      'fechaNacimiento': birthDate.toString(),
      'telefonos': telephones,
      'emails': emails,
      'iban': iban,
      'cuotaSocio': {'importe': feeAmount},
      'aceptaPublicidad': acceptSendNews,
      'aceptaAvisoLegal': acceptLegalNotice,
      'ubicacion': {
        'id': ubicationId,
        'nombre': ubicationName,
        'idPadre': ubicationParentId
      },
      'ciudad': city,
      'codigoPostal': postalCode,
      'direccion': address,
      'profesion': profession
    };
    UserProfileInformation example = UserProfileInformation.fromJson(json);
    expect(example.name, name);
    expect(example.lastName1, lastName1);
    expect(example.lastName2, lastName2);
    expect(example.dni, dni);
    expect(example.birthDate.toString(), birthDate.toString());
    expect(example.telephoneNumbers.length, telephones.length);
    expect(example.emails.length, emails.length);
    expect(example.iban, iban);
    expect(example.feeAmount.toString(), feeAmountRounded);
    expect(example.acceptSendNews, acceptSendNews);
    expect(example.acceptLegalNotice, acceptLegalNotice);
    expect(example.province.countryCode.toString(), ubicationParentId);
    expect(example.province.provinceCode.toString(), ubicationId);
    expect(example.province.provinceName, ubicationName);
    expect(example.city, city);
    expect(example.postalCode, postalCode);
    expect(example.address, address);
    expect(example.profession, profession);
  });

  test('User profile information to json method works correctly', () {
    String name = 'test';
    String lastName1 = 'test2';
    String lastName2 = 'test3';
    String dni = '111111111A';
    DateTime birthDate = DateTime.now();
    List<int> telephones = [];
    List<String> emails = [];
    String iban = '';
    String feeAmount = '10.2';
    String feeAmountRounded = '10';
    bool acceptSendNews = false;
    bool acceptLegalNotice = true;
    String ubicationId = '2';
    String ubicationName = 'A Coruña';
    String ubicationParentId = '1';
    String city = 'A Coruña';
    String postalCode = '11111';
    String address = '';
    String profession = '';
    Map<String, dynamic> json = {
      'nombre': name,
      'apellido1': lastName1,
      'apellido2': lastName2,
      'dni': dni,
      'fechaNacimiento': birthDate.toString(),
      'telefonos': telephones,
      'emails': emails,
      'iban': iban,
      'cuotaSocio': {'importe': feeAmount},
      'aceptaPublicidad': acceptSendNews,
      'aceptaAvisoLegal': acceptLegalNotice,
      'ubicacion': {
        'id': ubicationId,
        'nombre': ubicationName,
        'idPadre': ubicationParentId
      },
      'ciudad': city,
      'codigoPostal': postalCode,
      'direccion': address,
      'profesion': profession
    };
    UserProfileInformation example = UserProfileInformation.fromJson(json);
    Map<String, dynamic> jsonExpected = {
      'nombre': name,
      'apellido1': lastName1,
      'apellido2': lastName2,
      'fechaNacimiento': DateFormat('dd/MM/yyyy').format(birthDate),
      'dni': dni,
      'profesion': profession,
      'idUbicacion': int.parse(ubicationId),
      'direccion': address,
      'codigoPostal': postalCode,
      'ciudad': city,
      'iban': iban,
      'emails': emails,
      'telefonos': telephones,
      'importeSocioCuota': int.parse(feeAmountRounded),
      'aceptaAvisoLegal': 1,
      'aceptaPublicidad': 0
    };
    expect(example.toJson(), jsonExpected);
  });
}
