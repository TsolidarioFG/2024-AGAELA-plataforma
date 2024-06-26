import 'package:agaela_app/common_widgets/default_icon_form_field.dart';
import 'package:agaela_app/common_widgets/default_send_buttons.dart';
import 'package:agaela_app/features/edit_password/screens/edit_password.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets('The edit password widget has three text fields and two buttons',
      (tester) async {
    const textFieldsExpected = 3;

    await pumpL10nWidget(tester, const EditPassword());

    final textFieldsFinder = find.byType(DefaultIconFormField);
    final defaultSendButtonsFinder = find.byType(DefaultSendButtons);

    expect(textFieldsFinder, findsExactly(textFieldsExpected));
    expect(defaultSendButtonsFinder, findsOneWidget);
  });
}
