import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/features/forms/screens/carer_home.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets('The carer home has 4 buttons', (tester) async {
    const defaultButtonsExpected = 4;

    await pumpL10nWidget(tester, const CarerHome());

    final defaultButtonsFinder = find.byType(DefaultButton);

    expect(defaultButtonsFinder, findsExactly(defaultButtonsExpected));
  });
}
