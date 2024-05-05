import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditProfileHome extends StatefulWidget {
  const EditProfileHome({super.key});

  @override
  State<EditProfileHome> createState() => _EditProfileHomeState();
}

class _EditProfileHomeState extends State<EditProfileHome> {
  final EditProfileService _editProfileService = locator<EditProfileService>();

  Future<UserProfileInformation>? _request;

  @override
  void initState() {
    super.initState();
    if (Provider.of<UserProfileInformationProvider>(context, listen: false)
            .userProfileInformation ==
        null) {
      _request = _editProfileService.getUserProfileInformation('1234567A');
      _request!.then(
          (userInformation) => Provider.of<UserProfileInformationProvider>(
                  context,
                  listen: false)
              .setUserProfileInformation(userInformation),
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.report_problem),
              AppLocalizations.of(context)!
                  .editProfileErrorGettingUserInformation,
              () => Provider.of<LoggedUserProvider>(context, listen: false)
                      .loggedUser!
                      .isCarer
                  ? () => {}
                  : context.goNamed(RoutesNames.home.name)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text: AppLocalizations.of(context)!.editProfileHomeTitle,
      ),
      body: FutureBuilder(
        future: _request,
        builder: (BuildContext context,
                AsyncSnapshot<UserProfileInformation> snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: DefaultButton(
                            function: () => context.goNamed(
                                RoutesNames.identificationAndContact.name),
                            text: AppLocalizations.of(context)!
                                .editProfileIdentificationAndContact,
                          )),
                          Expanded(
                              child: DefaultButton(
                            function: () => {},
                            text: AppLocalizations.of(context)!
                                .editProfileLocalizationAndProfession,
                          )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: DefaultButton(
                            function: () => context.goNamed(
                                RoutesNames.bankDetailsAndPermissions.name),
                            text: AppLocalizations.of(context)!
                                .editProfileBankDetailsAndPermissions,
                          )),
                          Expanded(
                              child: DefaultButton(
                            function: () =>
                                context.goNamed(RoutesNames.editPassword.name),
                            text: AppLocalizations.of(context)!
                                .editPasswordButton,
                          )),
                        ],
                      ),
                      DefaultBackButton(
                          backPage: () => Provider.of<LoggedUserProvider>(
                                      context,
                                      listen: false)
                                  .loggedUser!
                                  .isCarer
                              ? () => {}
                              : context.goNamed(RoutesNames.home.name))
                    ],
                  ),
      ),
    );
  }
}
