import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';

abstract class EditProfileService {
  Future<UserProfileInformation> getUserProfileInformation(String dni);

  Future<void> setUserProfileInformation(
      String dni, UserProfileInformation userInformation);
}
