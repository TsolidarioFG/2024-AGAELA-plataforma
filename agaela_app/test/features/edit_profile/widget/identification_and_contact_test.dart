import 'package:agaela_app/features/edit_profile/screens/identification_and_contact.dart';
import 'package:agaela_app/features/edit_profile/widgets/birth_date_picker.dart';
import 'package:agaela_app/features/edit_profile/widgets/edit_profile_text_field.dart';
import 'package:agaela_app/features/edit_profile/widgets/send_cancel_buttons_edit_profile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets(
      'The identification and contact widget has 4 edit profile text field, 1 birth date picker, 2 add remove list elements and 1 button',
      (tester) async {
    const defaultEditProfileTextFieldExpected = 4;

    await pumpL10nWidget(tester, const IdentificationAndContact());

    final editProfileTextFieldsFinder = find.byType(EditProfileTextField);
    final birthDatePickerFieldFinder = find.byType(BirthDatePicker);
    final sendCancelButtonEditProfileFinder =
        find.byType(SendCancelButtonsEditProfile);

    expect(editProfileTextFieldsFinder,
        findsExactly(defaultEditProfileTextFieldExpected));
    expect(birthDatePickerFieldFinder, findsOneWidget);
    expect(sendCancelButtonEditProfileFinder, findsOneWidget);
  });
}
