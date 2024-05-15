import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:agaela_app/features/edit_profile/widgets/add_remove_list_elements.dart';
import 'package:agaela_app/features/edit_profile/widgets/birth_date_picker.dart';
import 'package:agaela_app/features/edit_profile/widgets/edit_profile_text_field.dart';
import 'package:agaela_app/features/edit_profile/widgets/send_cancel_buttons_edit_profile.dart';
import 'package:agaela_app/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class IdentificationAndContact extends StatefulWidget {
  const IdentificationAndContact({super.key});

  @override
  State<IdentificationAndContact> createState() =>
      _IdentificationAndContactState();
}

class _IdentificationAndContactState extends State<IdentificationAndContact> {
  final _identificationAndContactFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _lastName1Controller = TextEditingController();
  final _lastName2Controller = TextEditingController();
  final _dniController = TextEditingController();
  final _birthDateController = TextEditingController();
  late DateTime _birthDate;
  final ValueNotifier<bool> _formChanged = ValueNotifier<bool>(false);
  final List<int> _telephones = [];
  final List<String> _emails = [];

  @override
  void initState() {
    super.initState();
    UserProfileInformation userInformation =
        Provider.of<UserProfileInformationProvider>(context, listen: false)
            .userProfileInformation!;
    _nameController.text = userInformation.name;
    _lastName1Controller.text = userInformation.lastName1;
    _lastName2Controller.text = userInformation.lastName2;
    _dniController.text = userInformation.dni;
    _birthDate = userInformation.birthDate;
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    _birthDateController.text = formatter.format(_birthDate);
    _telephones.addAll(userInformation.telephoneNumbers);
    _emails.addAll(userInformation.emails);
  }

  UserProfileInformation _createUser() {
    UserProfileInformation userInformation =
        Provider.of<UserProfileInformationProvider>(context, listen: false)
            .userProfileInformation!;
    return UserProfileInformation(
        _nameController.text,
        _lastName1Controller.text,
        _lastName2Controller.text,
        _dniController.text,
        _birthDate,
        _telephones,
        _emails,
        userInformation.iban,
        userInformation.feeAmount,
        userInformation.acceptSendNews,
        userInformation.acceptLegalNotice,
        userInformation.country,
        userInformation.province,
        userInformation.city,
        userInformation.postalCode,
        userInformation.address,
        userInformation.profession);
  }

  void _changeForm() {
    setState(() {
      _formChanged.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text: AppLocalizations.of(context)!
            .editProfileIdentificationAndContactTitle,
      ),
      body: Form(
          key: _identificationAndContactFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () => _changeForm(),
          child: ListView(
            children: <Widget>[
              EditProfileTextField(
                  controller: _nameController,
                  text: AppLocalizations.of(context)!
                      .editProfileIdentificationAndContactNameField),
              EditProfileTextField(
                  controller: _lastName1Controller,
                  text: AppLocalizations.of(context)!
                      .editProfileIdentificationAndContactLastName1Field),
              EditProfileTextField(
                  controller: _lastName2Controller,
                  text: AppLocalizations.of(context)!
                      .editProfileIdentificationAndContactLastName2Field),
              EditProfileTextField(
                controller: _dniController,
                text: AppLocalizations.of(context)!
                    .editProfileIdentificationAndContactDniField,
                validator: (String? dni) {
                  return !dni!.isValidDni
                      ? AppLocalizations.of(context)!.errorDniNotValid
                      : null;
                },
              ),
              BirthDatePicker(
                dateController: _birthDateController,
                onChanged: (DateTime newDate) => _birthDate = newDate,
                initialState: _birthDate,
              ),
              AddRemoveListElements(
                title: AppLocalizations.of(context)!
                    .editProfileIdentificationAndContactTelephonesField,
                elements: _telephones,
                onRemove: (int index) => _telephones.removeAt(index),
                onAdded: (String element) {
                  int? number = int.tryParse(element);
                  if (number != null) _telephones.add(number);
                },
                elementValidator: (String? telephone) {
                  return !telephone!.isValidPhone
                      ? AppLocalizations.of(context)!.errorPhoneNotValid
                      : null;
                },
              ),
              AddRemoveListElements(
                title: AppLocalizations.of(context)!
                    .editProfileIdentificationAndContactEmailsField,
                elements: _emails,
                onRemove: (int index) => _emails.removeAt(index),
                onAdded: (String element) => _emails.add(element),
                elementValidator: (String? email) {
                  return !email!.isValidEmail
                      ? AppLocalizations.of(context)!.errorEmailNotValid
                      : null;
                },
              ),
            ],
          )),
      bottomNavigationBar: SendCancelButtonsEditProfile(
          createUser: () => _createUser(),
          formKey: _identificationAndContactFormKey,
          formChanged: _formChanged),
    );
  }
}
