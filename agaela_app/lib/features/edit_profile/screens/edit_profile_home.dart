import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditProfileHome extends StatelessWidget {
  const EditProfileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text: AppLocalizations.of(context)!.editProfileHomeTitle,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: DefaultButton(
                function: () => {},
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
                function: () => {},
                text: AppLocalizations.of(context)!
                    .editProfileBankDetailsAndPermissions,
              )),
              Expanded(
                  child: DefaultButton(
                function: () => {},
                text: AppLocalizations.of(context)!.editPasswordButton,
              )),
            ],
          ),
          DefaultBackButton(
              backPage: () =>
                  Provider.of<LoggedUserProvider>(context, listen: false)
                          .loggedUser!
                          .isCarer
                      ? () => {}
                      : context.goNamed(RoutesNames.home.name))
        ],
      ),
    );
  }
}
