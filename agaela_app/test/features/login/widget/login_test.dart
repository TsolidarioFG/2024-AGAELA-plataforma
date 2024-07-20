import 'package:agaela_app/common_widgets/default_icon_form_field.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/screens/login.dart';
import 'package:agaela_app/features/login/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/fake_data.dart';
import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  late LoginService mockLoginService;
  late LoggedUser mockData;

  setUpAll(() {
    initWidgetDependencies();
    mockLoginService = testLocator<LoginService>();
    mockData = getFakeCarer().loggedUser!;
    when(mockLoginService.loginWithToken())
        .thenAnswer((_) => Future.value(mockData));
  });

  test(
      'Test mock login service',
      () async =>
          {expect(await mockLoginService.loginWithToken(), equals(mockData))});

  testWidgets('The login widget has two text fields and two buttons',
      (tester) async {
    const expectedTextFields = 2;

    await pumpL10nWidget(tester, const Login());

    final textFieldsFinder = find.byType(DefaultIconFormField);
    final circularProgressFinder = find.byType(CircularProgressIndicator);
    final textButtonFinder = find.byType(TextButton);

    expect(textFieldsFinder, findsExactly(expectedTextFields));
    expect(circularProgressFinder, findsOneWidget);
    expect(textButtonFinder, findsOneWidget);
  });
}
