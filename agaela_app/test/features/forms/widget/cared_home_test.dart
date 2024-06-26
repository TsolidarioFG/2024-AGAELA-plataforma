import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/features/forms/screens/cared_home.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets('The cared home has 5 buttons and one dropdown', (tester) async {
    const defaultButtonsExpected = 4;

    await pumpL10nWidget(tester, const CaredHome());

    final defaultButtonsFinder = find.byType(DefaultButton);
    final defaultBackButtonFinder = find.byType(DefaultBackButton);

    expect(defaultButtonsFinder, findsExactly(defaultButtonsExpected));
    expect(defaultBackButtonFinder, findsOneWidget);
  });
}
