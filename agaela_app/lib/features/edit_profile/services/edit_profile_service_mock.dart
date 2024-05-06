import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';

class EditProfileServiceMock implements EditProfileService {
  @override
  Future<UserProfileInformation> getUserProfileInformation(String dni) async {
    const name = 'test';
    const lastName1 = 'test2';
    const lastName2 = 'test3';
    const dni = '1234567A';
    DateTime birthDate = DateTime.now();
    const telephones = [123456789, 987654321];
    const email = ['test@test.com', 'test2@test.com'];
    const iban = 'ES9121000418450200051332';
    const feeAmount = 20;
    const acceptSendNews = false;
    const acceptLegalNotice = true;
    Country country = Country(1, 'Spain');
    const province = 'A Coruña';
    const city = 'Coruña';
    const postalCode = '15009';
    const address = 'C. Alcalde Marchesi, 6';
    const profession = 'Profesor';
    const errorText = 'error';
    UserProfileInformation example = UserProfileInformation(
        name,
        lastName1,
        lastName2,
        dni,
        birthDate,
        telephones,
        email,
        iban,
        feeAmount,
        acceptSendNews,
        acceptLegalNotice,
        country,
        province,
        city,
        postalCode,
        address,
        profession);
    await Future.delayed(const Duration(seconds: 1));
    if (name == errorText) throw Exception();
    return example;
  }

  @override
  Future<void> setUserProfileInformation(
      String dni, UserProfileInformation userInformation) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Country>> getCountries() async {
    const error = false;
    Country spain = Country(1, 'España');
    Country france = Country(2, 'Francia');
    Country germany = Country(3, 'Alemania');
    List<Country> countries = [];
    countries.add(spain);
    countries.add(france);
    countries.add(germany);
    await Future.delayed(const Duration(seconds: 1));
    if (error) throw Exception();
    return countries;
  }
}
