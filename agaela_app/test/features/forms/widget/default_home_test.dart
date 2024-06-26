import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/features/forms/screens/default_home.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets('The default home has 5 buttons', (tester) async {
    const defaultButtonsExpected = 5;

    await pumpL10nWidget(tester, const DefaultHome());

    final defaultButtonsFinder = find.byType(DefaultButton);

    expect(defaultButtonsFinder, findsExactly(defaultButtonsExpected));
  });
}
