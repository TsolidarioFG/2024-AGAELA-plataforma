import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/default_icon_form_field.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final _passwordRecoveryFormKey = GlobalKey<FormState>();

  final _dniController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text: AppLocalizations.of(context)!.passwordRecoveryTitle,
      ),
      body: Form(
        key: _passwordRecoveryFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DefaultIconFormField(
                controller: _dniController,
                icon: const Icon(Icons.perm_identity),
                text: AppLocalizations.of(context)!.passwordRecoveryDniField,
                sensitiveInformation: false),
            Row(
              children: <Widget>[
                Expanded(
                    child: DefaultBackButton(
                  backPage: () => context.goNamed(RoutesNames.login.name),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
