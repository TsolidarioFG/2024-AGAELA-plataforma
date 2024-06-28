import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/screens/edit_profile_home.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/fake_data.dart';
import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  late EditProfileService mockEditProfileService;
  late UserProfileInformation mockData;
  late String code;

  setUpAll(() {
    initWidgetDependencies();
    mockEditProfileService = testLocator<EditProfileService>();
    mockData = getFakeUserProfileInformation().userProfileInformation!;
    code = getFakeCarer().loggedUser!.getActualCode();
    when(mockEditProfileService.getUserProfileInformation(code))
        .thenAnswer((_) => Future.value(mockData));
  });

  test(
      'Test mock edit profile service',
      () async => {
            expect(await mockEditProfileService.getUserProfileInformation(code),
                equals(mockData))
          });

  testWidgets('Edit profile loading indicator', (tester) async {
    await pumpL10nWidget(tester, const EditProfileHome());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets('The edit profile home widget has 4 buttons', (tester) async {
    const defaultButtonsExpected = 3;

    await pumpL10nWidget(tester, const EditProfileHome());

    await tester.pumpAndSettle();

    final defaultButtonFinder = find.byType(DefaultButton);
    final defaultBackButtonFinder = find.byType(DefaultBackButton);

    expect(defaultButtonFinder, findsExactly(defaultButtonsExpected));
    expect(defaultBackButtonFinder, findsOneWidget);
  });
}
