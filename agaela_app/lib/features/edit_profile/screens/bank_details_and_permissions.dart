import 'package:agaela_app/common_widgets/default_named_form_field.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BankDetailsAndPermissions extends StatefulWidget {
  const BankDetailsAndPermissions({super.key});

  @override
  State<BankDetailsAndPermissions> createState() =>
      _BankDetailsAndPermissionsState();
}

class _BankDetailsAndPermissionsState extends State<BankDetailsAndPermissions> {
  final _bankDetailsAndPermissionsFormKey = GlobalKey<FormState>();

  final _ibanController = TextEditingController();
  final _feeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    UserProfileInformation userInformation =
        Provider.of<UserProfileInformationProvider>(context, listen: false)
            .userProfileInformation!;
    _ibanController.text = userInformation.iban;
    _feeController.text = userInformation.feeAmount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text: AppLocalizations.of(context)!
            .editProfileBankDetailsAndPermissionsTitle,
      ),
      body: Form(
        key: _bankDetailsAndPermissionsFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DefaultNamedFormField(
                controller: _ibanController,
                name: AppLocalizations.of(context)!
                    .editProfileBankDetailsAndPermissionsIbanField,
                sensitiveInformation: false),
            DefaultNamedFormField(
                controller: _feeController,
                name: AppLocalizations.of(context)!
                    .editProfileBankDetailsAndPermissionsFeeField,
                sensitiveInformation: false),
          ],
        ),
      ),
      bottomNavigationBar: DefaultSendCancelButtons(
        sendFunction: () => {},
        cancelFunction: () => GoRouter.of(context).pop(),
      ),
    );
  }
}
