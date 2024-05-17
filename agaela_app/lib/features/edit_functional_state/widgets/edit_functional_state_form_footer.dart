import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/default_cancel_button.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditFunctionalStateFormFooter extends StatelessWidget {
  const EditFunctionalStateFormFooter(
      {super.key, required this.sendFunction, required this.noChangesFunction});

  final VoidCallback? sendFunction;

  final VoidCallback? noChangesFunction;

  bool checkUserIsCarer(BuildContext context) {
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    return actualUser.isCarer && actualUser.id == actualUser.selectedId;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: DefaultButton(
            function: sendFunction,
            text: AppLocalizations.of(context)!.commonSendButtonText,
          ),
        ),
        Expanded(
          child: DefaultButton(
            text: AppLocalizations.of(context)!
                .editFunctionalStateNoChangesButton,
            function: noChangesFunction,
          ),
        ),
        Expanded(
            child: DefaultCancelButton(
          cancelFunction: () => checkUserIsCarer(context)
              ? context.goNamed(RoutesNames.carerHome.name)
              : GoRouter.of(context).pop(),
        ))
      ],
    );
  }
}
