import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:agaela_app/features/edit_profile/models/province.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';

abstract class EditProfileService {
  Future<UserProfileInformation> getUserProfileInformation(int id);

  Future<void> setUserProfileInformation(
      int id, UserProfileInformation userInformation);

  Future<List<Country>> getCountries();

  Future<List<Province>> getProvinces(int countryCode);
}
