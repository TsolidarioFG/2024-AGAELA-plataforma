import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:agaela_app/features/edit_profile/models/province.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';

abstract class EditProfileService {
  Future<UserProfileInformation> getUserProfileInformation(String code);

  Future<void> setUserProfileInformation(
      String code, UserProfileInformation userInformation);

  Future<List<Country>> getCountries();

  Future<List<Province>> getProvinces(int countryCode);
}
