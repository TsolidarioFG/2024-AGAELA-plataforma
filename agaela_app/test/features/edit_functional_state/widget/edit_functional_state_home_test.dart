import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/features/edit_functional_state/screens/edit_functional_state_home.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets('The edit functional state home has 3 buttons', (tester) async {
    const defaultButtonsExpected = 2;

    await pumpL10nWidget(tester, const EditFunctionalStateHome());

    final defaultButtonsFinder = find.byType(DefaultButton);
    final defaultBackButtonFinder = find.byType(DefaultBackButton);

    expect(defaultButtonsFinder, findsExactly(defaultButtonsExpected));
    expect(defaultBackButtonFinder, findsOneWidget);
  });
}
