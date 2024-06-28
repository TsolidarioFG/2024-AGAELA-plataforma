import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/models/cards_and_income_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/edit_social_procedures_saved_types.dart';
import 'package:agaela_app/features/edit_social_procedures/screens/cards_and_income.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/fake_data.dart';
import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  late EditSocialProceduresService mockEditSocialProceduresService;
  late String code;
  late CardsAndIncomeModel cardsAndIncomeModel;
  late EditSocialProceduresSavedTypes editSocialProceduresSavedTypes;

  setUpAll(() {
    initWidgetDependencies();
    mockEditSocialProceduresService =
        testLocator<EditSocialProceduresService>();
    code = getFakeCarer().loggedUser!.getActualCode();
    cardsAndIncomeModel = CardsAndIncomeModel();
    editSocialProceduresSavedTypes = getFakeEditSocialProceduresSavedTypes();
    when(mockEditSocialProceduresService.getCardsAndIncomeTypes(
            code,
            editSocialProceduresSavedTypes.healthCardTypes,
            editSocialProceduresSavedTypes.parkingCardTypes,
            editSocialProceduresSavedTypes.netIncomeTypes))
        .thenAnswer((_) => Future.value(cardsAndIncomeModel));
  });

  test(
      'Test mock edit social procedures service get cards and income types',
      () async => {
            expect(
                await mockEditSocialProceduresService.getCardsAndIncomeTypes(
                    code,
                    editSocialProceduresSavedTypes.healthCardTypes,
                    editSocialProceduresSavedTypes.parkingCardTypes,
                    editSocialProceduresSavedTypes.netIncomeTypes),
                equals(cardsAndIncomeModel))
          });

  testWidgets('Cards and income loading indicator', (tester) async {
    await pumpL10nWidget(tester, const CardsAndIncome());

    final circularProgressIndicatorFinder =
        find.byType(CircularProgressIndicator);

    expect(circularProgressIndicatorFinder, findsOneWidget);
  });

  testWidgets(
      'The cards and income widget has 4 text bold style, 4 list views and 1 default send cancel buttons',
      (tester) async {
    const textBoldStyleExpected = 4;
    const listViewsExpected = 4;

    await pumpL10nWidget(tester, const CardsAndIncome());

    await tester.pumpAndSettle();

    final textBoldStyleFinder = find.byType(TextBoldStyle);
    final listViewsFinder = find.byType(ListView);
    final defaultSendCancelButtonsFinder =
        find.byType(DefaultSendCancelButtons);

    expect(textBoldStyleFinder, findsExactly(textBoldStyleExpected));
    expect(listViewsFinder, findsExactly(listViewsExpected));
    expect(defaultSendCancelButtonsFinder, findsOneWidget);
  });
}
