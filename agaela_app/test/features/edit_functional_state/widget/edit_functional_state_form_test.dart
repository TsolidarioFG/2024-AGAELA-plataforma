import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form.dart';
import 'package:agaela_app/features/edit_functional_state/screens/edit_functional_state_form.dart';
import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/fake_data.dart';
import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  late EditFunctionalStateService mockEditFunctionalStateService;
  late ActualForm mockData;
  late String code;

  setUpAll(() {
    initWidgetDependencies();
    mockEditFunctionalStateService = testLocator<EditFunctionalStateService>();
    mockData = getFakeActualForm().actualForm!;
    code = getFakeCarer().loggedUser!.getActualCode();
    when(mockEditFunctionalStateService.getPreviousAnswers(
            mockData.formId, code))
        .thenAnswer((_) => Future.value(null));
  });

  test(
      'Test mock edit functional state service',
      () async => {
            expect(
                await mockEditFunctionalStateService.getPreviousAnswers(
                    mockData.formId, code),
                equals(null))
          });

  testWidgets('Edit functional state form loading indicator', (tester) async {
    await pumpL10nWidget(tester, const EditFunctionalStateForm());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'The edit functional state form widget has 1 list view and 1 default send cancel buttons',
      (tester) async {
    await pumpL10nWidget(tester, const EditFunctionalStateForm());

    await tester.pumpAndSettle();

    final listViewFinder = find.byType(ListView);
    final defaultSendCancelButtonsFinder =
        find.byType(DefaultSendCancelButtons);

    expect(listViewFinder, findsOneWidget);
    expect(defaultSendCancelButtonsFinder, findsOneWidget);
  });
}
