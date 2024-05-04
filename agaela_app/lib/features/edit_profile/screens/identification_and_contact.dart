import 'package:agaela_app/common_widgets/default_named_form_field.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
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
          child: ListView(
            children: <Widget>[
              DefaultNamedFormField(
                  controller: _nameController,
                  name: AppLocalizations.of(context)!
                      .editProfileIdentificationAndContactNameField,
                  sensitiveInformation: false),
              const Divider(),
              DefaultNamedFormField(
                  controller: _lastName1Controller,
                  name: AppLocalizations.of(context)!
                      .editProfileIdentificationAndContactLastName1Field,
                  sensitiveInformation: false),
              const Divider(),
              DefaultNamedFormField(
                  controller: _lastName2Controller,
                  name: AppLocalizations.of(context)!
                      .editProfileIdentificationAndContactLastName2Field,
                  sensitiveInformation: false),
              const Divider(),
              DefaultNamedFormField(
                  controller: _dniController,
                  name: AppLocalizations.of(context)!
                      .editProfileIdentificationAndContactDniField,
                  sensitiveInformation: false),
              const Divider(),
            ],
          )),
      bottomNavigationBar: DefaultSendCancelButtons(
          sendFunction: () => {},
          cancelFunction: () => GoRouter.of(context).pop()),
    );
  }
}
