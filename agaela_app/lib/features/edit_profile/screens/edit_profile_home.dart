import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/scrolleable_widget.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:agaela_app/utils/get_cared_name.dart';
import 'package:agaela_app/utils/go_home.dart';
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
  final double height = 20.0;

  final double width = 5.0;

  final EditProfileService _editProfileService = locator<EditProfileService>();

  Future<UserProfileInformation>? _request;

  late LoggedUser _actualUser;

  @override
  void initState() {
    super.initState();
    _actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    _request =
        _editProfileService.getUserProfileInformation(_actualUser.selectedId);
    _request!.then(
        (userInformation) =>
            Provider.of<UserProfileInformationProvider>(context, listen: false)
                .setUserProfileInformation(userInformation),
        onError: (_) => showDefaultAlertDialog(
            context,
            const Icon(Icons.report_problem),
            AppLocalizations.of(context)!
                .editProfileErrorGettingUserInformation,
            () => goToHome(context)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(
            text: _actualUser.isCared()
                ? '${AppLocalizations.of(context)!.editProfileCaredHomeTitle} ${getCaredName(context)}'
                : AppLocalizations.of(context)!.editProfileHomeTitle),
        body: ScrolleableWidget(
          child: FutureBuilder(
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
                          SizedBox(
                            height: height,
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: width,
                              ),
                              Expanded(
                                  child: DefaultButton(
                                function: () => context.goNamed(
                                    RoutesNames.identificationAndContact.name),
                                text: AppLocalizations.of(context)!
                                    .editProfileIdentificationAndContact,
                              )),
                              SizedBox(
                                width: width,
                              ),
                              Expanded(
                                  child: DefaultButton(
                                function: () => context.goNamed(
                                    RoutesNames.localizationAndProfession.name),
                                text: AppLocalizations.of(context)!
                                    .editProfileLocalizationAndProfession,
                              )),
                              SizedBox(
                                width: width,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height,
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: width,
                              ),
                              Expanded(
                                  child: DefaultButton(
                                function: () => context.goNamed(
                                    RoutesNames.bankDetailsAndPermissions.name),
                                text: AppLocalizations.of(context)!
                                    .editProfileBankDetailsAndPermissions,
                              )),
                              SizedBox(
                                width: width,
                              ),
                              _actualUser.id == _actualUser.selectedId
                                  ? Expanded(
                                      child: DefaultButton(
                                      function: () => context.goNamed(
                                          RoutesNames.editPassword.name),
                                      text: AppLocalizations.of(context)!
                                          .editPasswordButton,
                                    ))
                                  : const Expanded(
                                      child: SizedBox(child: null)),
                              SizedBox(
                                width: width,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height,
                          ),
                          DefaultBackButton(backPage: () => goToHome(context))
                        ],
                      ),
          ),
        ));
  }
}
