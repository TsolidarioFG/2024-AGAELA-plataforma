import 'package:agaela_app/common_widgets/default_icon_form_field.dart';
import 'package:agaela_app/common_widgets/default_send_buttons.dart';
import 'package:agaela_app/features/password_recovery/screens/password_recovery.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets('The password recovery widget has one text field and two buttons',
      (tester) async {
    await pumpL10nWidget(tester, const PasswordRecovery());

    final textFieldFinder = find.byType(DefaultIconFormField);
    final defaultSendButtonsFinder = find.byType(DefaultSendButtons);

    expect(textFieldFinder, findsOneWidget);
    expect(defaultSendButtonsFinder, findsOneWidget);
  });
}
