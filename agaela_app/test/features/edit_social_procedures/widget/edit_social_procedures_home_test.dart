import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/features/edit_social_procedures/screens/edit_social_procedures_home.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets('The edit social procedures home widget has 5 buttons',
      (tester) async {
    const defaultButtonsExpected = 4;

    await pumpL10nWidget(tester, const EditSocialProceduresHome());

    final defaultButtonsFinder = find.byType(DefaultButton);
    final defaultBackButtonsFinder = find.byType(DefaultBackButton);

    expect(defaultButtonsFinder, findsExactly(defaultButtonsExpected));
    expect(defaultBackButtonsFinder, findsOneWidget);
  });
}
