import 'package:agaela_app/common_widgets/default_send_buttons.dart';
import 'package:agaela_app/features/report_incident/screens/report_incident.dart';
import 'package:agaela_app/features/report_incident/widgets/report_incident_text_field.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets('The report incident widget has one text field and two buttons',
      (tester) async {
    await pumpL10nWidget(tester, const ReportIncident());

    final textFieldFinder = find.byType(ReportIncidentTextField);
    final defaultSendButtonsFinder = find.byType(DefaultSendButtons);

    expect(textFieldFinder, findsOneWidget);
    expect(defaultSendButtonsFinder, findsOneWidget);
  });
}
