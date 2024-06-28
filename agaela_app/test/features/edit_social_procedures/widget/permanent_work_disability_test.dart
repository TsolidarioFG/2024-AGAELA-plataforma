import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/features/edit_social_procedures/models/edit_social_procedures_saved_types.dart';
import 'package:agaela_app/features/edit_social_procedures/models/permanent_work_disability_model.dart';
import 'package:agaela_app/features/edit_social_procedures/screens/permanent_work_disability.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/edit_social_procedures/widgets/common_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/fake_data.dart';
import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  late EditSocialProceduresService mockEditSocialProceduresService;
  late String code;
  late PermanentWorkDisabilityModel permanentWorkDisabilityModel;
  late EditSocialProceduresSavedTypes editSocialProceduresSavedTypes;

  setUpAll(() {
    initWidgetDependencies();
    mockEditSocialProceduresService =
        testLocator<EditSocialProceduresService>();
    code = getFakeCarer().loggedUser!.getActualCode();
    permanentWorkDisabilityModel = PermanentWorkDisabilityModel();
    editSocialProceduresSavedTypes = getFakeEditSocialProceduresSavedTypes();
    when(mockEditSocialProceduresService.getPermanentWorkDisabilityField(
            code,
            editSocialProceduresSavedTypes.processedTypes,
            editSocialProceduresSavedTypes.resolvedDisabilityTypes,
            editSocialProceduresSavedTypes.unresolvedProceduresTypes))
        .thenAnswer((_) => Future.value(permanentWorkDisabilityModel));
  });

  test(
      'Test mock edit social procedures service get permanent work disability field',
      () async => {
            expect(
                await mockEditSocialProceduresService
                    .getPermanentWorkDisabilityField(
                        code,
                        editSocialProceduresSavedTypes.processedTypes,
                        editSocialProceduresSavedTypes.resolvedDisabilityTypes,
                        editSocialProceduresSavedTypes
                            .unresolvedProceduresTypes),
                equals(permanentWorkDisabilityModel))
          });

  testWidgets('Permanent work disability loading indicator', (tester) async {
    await pumpL10nWidget(tester, const PermanentWorkDisability());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'The Permanent work disability widget has 1 common fields and 1 default send cancel buttons',
      (tester) async {
    await pumpL10nWidget(tester, const PermanentWorkDisability());

    await tester.pumpAndSettle();

    final commonFieldsFinder = find.byType(CommonFields);
    final defaultSendCancelButtonsFinder =
        find.byType(DefaultSendCancelButtons);

    expect(commonFieldsFinder, findsOneWidget);
    expect(defaultSendCancelButtonsFinder, findsOneWidget);
  });
}
