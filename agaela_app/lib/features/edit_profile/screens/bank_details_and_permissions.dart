import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:agaela_app/features/edit_profile/widgets/edit_profile_text_field.dart';
import 'package:agaela_app/features/edit_profile/widgets/send_cancel_buttons_edit_profile.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

  final ValueNotifier<bool> _formChanged = ValueNotifier<bool>(false);

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

  void _changeForm() {
    setState(() {
      _formChanged.value = true;
    });
  }

  UserProfileInformation _createUser() {
    int? feeAmount = int.tryParse(_feeController.text);
    UserProfileInformation userInformation =
        Provider.of<UserProfileInformationProvider>(context, listen: false)
            .userProfileInformation!;
    feeAmount ??= userInformation.feeAmount;
    return UserProfileInformation(
        userInformation.name,
        userInformation.lastName1,
        userInformation.lastName2,
        userInformation.dni,
        userInformation.birthDate,
        userInformation.telephoneNumbers,
        userInformation.emails,
        _ibanController.text,
        feeAmount,
        _acceptNews,
        _acceptLegalNotice,
        userInformation.country,
        userInformation.province,
        userInformation.city,
        userInformation.postalCode,
        userInformation.address,
        userInformation.profession);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(
          text:
              '${AppLocalizations.of(context)!.editProfileBankDetailsAndPermissionsTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
        ),
        body: Form(
          key: _bankDetailsAndPermissionsFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () => _changeForm(),
          child: ListView(
            children: <Widget>[
              EditProfileTextField(
                controller: _ibanController,
                text: AppLocalizations.of(context)!
                    .editProfileBankDetailsAndPermissionsIbanField,
                validator: (String? iban) {
                  return !iban!.isValidIban
                      ? AppLocalizations.of(context)!.errorIbanNotValid
                      : null;
                },
              ),
              EditProfileTextField(
                controller: _feeController,
                text: AppLocalizations.of(context)!
                    .editProfileBankDetailsAndPermissionsFeeField,
                validator: (String? fee) {
                  return !fee!.isValidNumber
                      ? AppLocalizations.of(context)!.errorNumberNotValid
                      : null;
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SendCancelButtonsEditProfile(
            createUser: () => _createUser(),
            formKey: _bankDetailsAndPermissionsFormKey,
            formChanged: _formChanged,
          ),
        ));
  }
}
