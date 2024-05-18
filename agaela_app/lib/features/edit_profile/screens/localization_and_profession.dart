import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:agaela_app/features/edit_profile/models/province.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';
import 'package:agaela_app/features/edit_profile/widgets/country_dropdown.dart';
import 'package:agaela_app/features/edit_profile/widgets/edit_profile_text_field.dart';
import 'package:agaela_app/features/edit_profile/widgets/province_dropdown.dart';
import 'package:agaela_app/features/edit_profile/widgets/send_cancel_buttons_edit_profile.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:agaela_app/utils/get_cared_name.dart';
import 'package:agaela_app/utils/string_utils.dart';
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
  final EditProfileService _editProfileService = locator<EditProfileService>();
  Future<List<Country>>? _countriesRequest;
  Future<List<Province>>? _provincesRequest;

  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _addressController = TextEditingController();
  final _professionController = TextEditingController();

  late Country _country;

  late Province _province;

  List<Country>? _countries;

  List<Province>? _provinces;

  final ValueNotifier<bool> _formChanged = ValueNotifier<bool>(false);

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
    _country = userInformation.country;
    _province = userInformation.province;
    _getCountries();
    _getProvinces(_country.countryCode);
  }

  void _getCountries() {
    _countriesRequest = _editProfileService.getCountries();
    _countriesRequest!.then(
        (countries) => setState(() {
              _countries = countries;
            }),
        onError: (_) => showDefaultAlertDialog(
            context,
            const Icon(Icons.warning),
            AppLocalizations.of(context)!
                .editProfileLocalizationAndProfessionCountriesError,
            () => context.goNamed(RoutesNames.editProfile.name)));
  }

  void _getProvinces(int countryCode) {
    setState(() {
      _provincesRequest = _editProfileService.getProvinces(countryCode);
      _provincesRequest!.then(
          (provinces) => setState(() {
                _provinces = provinces;
              }),
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.warning),
              AppLocalizations.of(context)!
                  .editProfileLocalizationAndProfessionProvincesError,
              () => context.goNamed(RoutesNames.editProfile.name)));
    });
  }

  void _changeForm() {
    setState(() {
      _formChanged.value = true;
    });
  }

  UserProfileInformation _createUser() {
    UserProfileInformation userInformation =
        Provider.of<UserProfileInformationProvider>(context, listen: false)
            .userProfileInformation!;
    return UserProfileInformation(
        userInformation.name,
        userInformation.lastName1,
        userInformation.lastName2,
        userInformation.dni,
        userInformation.birthDate,
        userInformation.telephoneNumbers,
        userInformation.emails,
        userInformation.iban,
        userInformation.feeAmount,
        userInformation.acceptSendNews,
        userInformation.acceptLegalNotice,
        _country,
        _province,
        _cityController.text,
        _postalCodeController.text,
        _addressController.text,
        _professionController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(
            text:
                '${AppLocalizations.of(context)!.editProfileLocalizationAndProfessionTitle} ${getCaredName(context)}'),
        body: Form(
            key: _localizationAndProfessionFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: () => _changeForm(),
            child: FutureBuilder(
              future: _countriesRequest,
              builder: (BuildContext context, AsyncSnapshot snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView(
                          children: <Widget>[
                            if (_countries != null)
                              CountryDropdown(
                                  countries: _countries!,
                                  initialState: _country,
                                  onChanged: _getProvinces,
                                  setCountry: (Country country) =>
                                      _country = country),
                            if (_provinces != null)
                              FutureBuilder(
                                  future: _provincesRequest,
                                  builder: (BuildContext context,
                                          AsyncSnapshot snapshot) =>
                                      snapshot.connectionState ==
                                              ConnectionState.waiting
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ProvinceDropdown(
                                              provinces: _provinces!,
                                              initialState: _province,
                                              setProvince:
                                                  (Province province) =>
                                                      _province = province)),
                            EditProfileTextField(
                                controller: _cityController,
                                text: AppLocalizations.of(context)!
                                    .editProfileLocalizationAndProfessionCityField),
                            EditProfileTextField(
                              controller: _postalCodeController,
                              text: AppLocalizations.of(context)!
                                  .editProfileLocalizationAndProfessionPostalCodeField,
                              validator: (String? postalCode) {
                                return !postalCode!.isValidPostalCode
                                    ? AppLocalizations.of(context)!
                                        .errorPostalCodeNotValid
                                    : null;
                              },
                            ),
                            EditProfileTextField(
                                controller: _addressController,
                                text: AppLocalizations.of(context)!
                                    .editProfileLocalizationAndProfessionAddressField),
                            EditProfileTextField(
                                controller: _professionController,
                                text: AppLocalizations.of(context)!
                                    .editProfileLocalizationAndProfessionProfessionField),
                          ],
                        ),
            )),
        bottomNavigationBar: SendCancelButtonsEditProfile(
          createUser: () => _createUser(),
          formKey: _localizationAndProfessionFormKey,
          formChanged: _formChanged,
        ));
  }
}
