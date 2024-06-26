import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/features/notifications/screens/notifications_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/init_widget_dependencies.dart';
import '../../../utils/pump_l10n_widget.dart';

void main() {
  setUp(() => initWidgetDependencies());

  testWidgets('The notifications home widget has 1 text and 1 button',
      (tester) async {
    await pumpL10nWidget(tester, const NotificationsHome());

    final textFinder = find.byType(Center);
    final defaultBackButtonFinder = find.byType(DefaultBackButton);

    expect(textFinder, findsOneWidget);
    expect(defaultBackButtonFinder, findsOneWidget);
  });
}
