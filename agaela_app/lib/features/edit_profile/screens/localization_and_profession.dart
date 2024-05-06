import 'package:agaela_app/common_widgets/default_named_form_field.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LocalizationAndProfession extends StatefulWidget {
  const LocalizationAndProfession({super.key});

  @override
  State<LocalizationAndProfession> createState() =>
      _LocalizationAndProfessionState();
}

class _LocalizationAndProfessionState extends State<LocalizationAndProfession> {
  final _localizationAndProfessionFormKey = GlobalKey<FormState>();

  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _addressController = TextEditingController();
  final _professionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    UserProfileInformation userInformation =
        Provider.of<UserProfileInformationProvider>(context, listen: false)
            .userProfileInformation!;
    _cityController.text = userInformation.city;
    _postalCodeController.text = userInformation.postalCode;
    _addressController.text = userInformation.address;
    _professionController.text = userInformation.profession;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
          text: AppLocalizations.of(context)!
              .editProfileLocalizationAndProfessionTitle),
      body: Form(
        key: _localizationAndProfessionFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DefaultNamedFormField(
                controller: _cityController,
                name: AppLocalizations.of(context)!
                    .editProfileLocalizationAndProfessionCityField,
                sensitiveInformation: false),
            DefaultNamedFormField(
                controller: _postalCodeController,
                name: AppLocalizations.of(context)!
                    .editProfileLocalizationAndProfessionPostalCodeField,
                sensitiveInformation: false),
            DefaultNamedFormField(
                controller: _addressController,
                name: AppLocalizations.of(context)!
                    .editProfileLocalizationAndProfessionAddressField,
                sensitiveInformation: false),
            DefaultNamedFormField(
                controller: _professionController,
                name: AppLocalizations.of(context)!
                    .editProfileLocalizationAndProfessionProfessionField,
                sensitiveInformation: false)
          ],
        ),
      ),
      bottomNavigationBar: DefaultSendCancelButtons(
          sendFunction: () => {},
          cancelFunction: () => GoRouter.of(context).pop()),
    );
  }
}
