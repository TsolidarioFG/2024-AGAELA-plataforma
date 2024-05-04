import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:flutter/material.dart';

class UserProfileInformationProvider extends ChangeNotifier {
  UserProfileInformation? _userProfileInformation;

  void setUserProfileInformation(
      UserProfileInformation userProfileInformation) {
    _userProfileInformation = userProfileInformation;
    notifyListeners();
  }

  UserProfileInformation? get userProfileInformation => _userProfileInformation;
}
