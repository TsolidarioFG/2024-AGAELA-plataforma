import 'package:agaela_app/features/edit_profile/screens/bank_details_and_permissions.dart';
import 'package:agaela_app/features/edit_profile/widgets/edit_profile_text_field.dart';
import 'package:agaela_app/features/edit_profile/widgets/send_cancel_buttons_edit_profile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets(
      'The bank details and permissions widget has 2 edit profile text field and 1 button',
      (tester) async {
    const defaultEditProfileTextFieldExpected = 2;

    await pumpL10nWidget(tester, const BankDetailsAndPermissions());

    final editProfileTextFieldsFinder = find.byType(EditProfileTextField);
    final sendCancelButtonEditProfileFinder =
        find.byType(SendCancelButtonsEditProfile);

    expect(editProfileTextFieldsFinder,
        findsExactly(defaultEditProfileTextFieldExpected));
    expect(sendCancelButtonEditProfileFinder, findsOneWidget);
  });
}
