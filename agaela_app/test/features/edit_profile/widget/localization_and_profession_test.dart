import 'package:agaela_app/common_widgets/default_text_field.dart';
import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:agaela_app/features/edit_profile/models/province.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/screens/localization_and_profession.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';
import 'package:agaela_app/features/edit_profile/widgets/country_dropdown.dart';
import 'package:agaela_app/features/edit_profile/widgets/province_dropdown.dart';
import 'package:agaela_app/features/edit_profile/widgets/send_cancel_buttons_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/fake_data.dart';
import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  late EditProfileService mockEditProfileService;
  late int countryCode;
  late Country country;
  late Province province;

  setUpAll(() {
    initWidgetDependencies();
    mockEditProfileService = testLocator<EditProfileService>();
    UserProfileInformation userData =
        getFakeUserProfileInformation().userProfileInformation!;
    countryCode = userData.province.countryCode;
    country = Country(1, 'España');
    province = Province(2, 'A Coruña', 1);
    when(mockEditProfileService.getCountries())
        .thenAnswer((_) => Future.value([country]));
    when(mockEditProfileService.getProvinces(countryCode))
        .thenAnswer((_) => Future.value([province]));
  });

  test('Test mock edit profile service countries and provinces', () async {
    expect(await mockEditProfileService.getCountries(), equals([country]));
    expect(await mockEditProfileService.getProvinces(countryCode),
        equals([province]));
  });

  testWidgets('Localization and profession loading indicator', (tester) async {
    await pumpL10nWidget(tester, const LocalizationAndProfession());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'The Localization and profession widget has 1 country dropdown, 1 province dropdown, 4 edit profile text fields and 1 send cancel buttons',
      (tester) async {
    const editProfileTextFieldsExpected = 3;

    await pumpL10nWidget(tester, const LocalizationAndProfession());

    await tester.pumpAndSettle();

    final countryDropdown = find.byType(CountryDropdown);
    final provinceDropdown = find.byType(ProvinceDropdown);
    final editProfileTextFieldFinder = find.bySubtype<DefaultTextField>();
    final sendCancelButtonsFinder = find.byType(SendCancelButtonsEditProfile);

    expect(countryDropdown, findsOneWidget);
    expect(provinceDropdown, findsOneWidget);
    expect(editProfileTextFieldFinder,
        findsAtLeast(editProfileTextFieldsExpected));
    expect(sendCancelButtonsFinder, findsOneWidget);
  });
}
