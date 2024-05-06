import 'package:agaela_app/common_widgets/default_named_form_field.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:agaela_app/features/edit_profile/widgets/click_color_button.dart';
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

  late bool _acceptNews;

  late bool _acceptLegalNotice;

  @override
  void initState() {
    super.initState();
    UserProfileInformation userInformation =
        Provider.of<UserProfileInformationProvider>(context, listen: false)
            .userProfileInformation!;
    _ibanController.text = userInformation.iban;
    _feeController.text = userInformation.feeAmount.toString();
    _acceptNews = userInformation.acceptSendNews;
    _acceptLegalNotice = userInformation.acceptLegalNotice;
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
            ClickColorButton(
                function: () => _acceptNews = !_acceptNews,
                clickedText: AppLocalizations.of(context)!
                    .editProfileBankDetailsAndPermissionsClickedNewsButton,
                notClickedText: AppLocalizations.of(context)!
                    .editProfileBankDetailsAndPermissionsNotClickedNewsButton,
                initialState: _acceptNews),
            ClickColorButton(
                function: () => _acceptLegalNotice = !_acceptLegalNotice,
                clickedText: AppLocalizations.of(context)!
                    .editProfileBankDetailsAndPermissionsClickedLegalNoticeButton,
                notClickedText: AppLocalizations.of(context)!
                    .editProfileBankDetailsAndPermissionsNotClickedLegalNoticeButton,
                initialState: _acceptLegalNotice),
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
