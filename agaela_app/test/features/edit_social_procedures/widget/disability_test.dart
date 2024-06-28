import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/features/edit_social_procedures/models/disability_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/edit_social_procedures_saved_types.dart';
import 'package:agaela_app/features/edit_social_procedures/screens/disability.dart';
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
  late DisabilityModel disabilityModel;
  late EditSocialProceduresSavedTypes editSocialProceduresSavedTypes;

  setUpAll(() {
    initWidgetDependencies();
    mockEditSocialProceduresService =
        testLocator<EditSocialProceduresService>();
    code = getFakeCarer().loggedUser!.getActualCode();
    disabilityModel = DisabilityModel();
    editSocialProceduresSavedTypes = getFakeEditSocialProceduresSavedTypes();
    when(mockEditSocialProceduresService.getDisabilityFields(
            code,
            editSocialProceduresSavedTypes.processedTypes,
            editSocialProceduresSavedTypes.unresolvedProceduresTypes))
        .thenAnswer((_) => Future.value(disabilityModel));
  });

  test(
      'Test mock edit social procedures service get disability fields',
      () async => {
            expect(
                await mockEditSocialProceduresService.getDisabilityFields(
                    code,
                    editSocialProceduresSavedTypes.processedTypes,
                    editSocialProceduresSavedTypes.unresolvedProceduresTypes),
                equals(disabilityModel))
          });

  testWidgets('Disability loading indicator', (tester) async {
    await pumpL10nWidget(tester, const Disability());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'The disability widget has 1 common fields and 1 default send cancel buttons',
      (tester) async {
    await pumpL10nWidget(tester, const Disability());

    await tester.pumpAndSettle();

    final commonFieldsFinder = find.byType(CommonFields);
    final defaultSendCancelButtonsFinder =
        find.byType(DefaultSendCancelButtons);

    expect(commonFieldsFinder, findsOneWidget);
    expect(defaultSendCancelButtonsFinder, findsOneWidget);
  });
}
