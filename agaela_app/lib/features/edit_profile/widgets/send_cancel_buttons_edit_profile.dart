import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

typedef CreateUserFunction = UserProfileInformation Function();

class SendCancelButtonsEditProfile extends StatefulWidget {
  final CreateUserFunction createUser;

  final GlobalKey<FormState> formKey;

  const SendCancelButtonsEditProfile(
      {super.key, required this.createUser, required this.formKey});

  @override
  State<SendCancelButtonsEditProfile> createState() =>
      _SendCancelButtonsEditProfileState();
}

class _SendCancelButtonsEditProfileState
    extends State<SendCancelButtonsEditProfile> {
  final EditProfileService _editProfileService = locator<EditProfileService>();
  Future<void>? _saveChangesRequest;

  void _saveChanges() {
    LoggedUser userInformation =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    UserProfileInformation user = widget.createUser();
    setState(() {
      _saveChangesRequest = _editProfileService.setUserProfileInformation(
          userInformation.selectedId, user);
      _saveChangesRequest!.then(
          (_) => {
                Provider.of<UserProfileInformationProvider>(context,
                        listen: false)
                    .setUserProfileInformation(user),
                showDefaultAlertDialog(
                    context,
                    const Icon(Icons.check),
                    AppLocalizations.of(context)!.editProfileSavedChanges,
                    () => context.goNamed(RoutesNames.editProfile.name))
              },
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.error),
              AppLocalizations.of(context)!.editProfileErrorSavingChanges,
              () => context.goNamed(RoutesNames.editProfile.name)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _saveChangesRequest,
      builder: (BuildContext context, AsyncSnapshot snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : DefaultSendCancelButtons(
                  sendFunction: () => {
                        if (widget.formKey.currentState!.validate())
                          _saveChanges()
                      },
                  cancelFunction: () => GoRouter.of(context).pop()),
    );
  }
}
