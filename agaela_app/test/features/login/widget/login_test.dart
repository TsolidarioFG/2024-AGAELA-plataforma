import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/default_icon_form_field.dart';
import 'package:agaela_app/features/login/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets('The login widget has two text fields and two buttons',
      (tester) async {
    const expectedTextFields = 2;

    await pumpL10nWidget(tester, const Login());

    final textFieldsFinder = find.byType(DefaultIconFormField);
    final defaultButtonFinder = find.byType(DefaultButton);
    final textButtonFinder = find.byType(TextButton);

    expect(textFieldsFinder, findsExactly(expectedTextFields));
    expect(defaultButtonFinder, findsOneWidget);
    expect(textButtonFinder, findsOneWidget);
  });
}
