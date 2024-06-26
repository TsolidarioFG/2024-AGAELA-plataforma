import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'fake_data.dart';

Future<void> pumpL10nWidget(WidgetTester tester, Widget widget) async {
  return tester.pumpWidget(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getFakeCarer(),
        ),
        ChangeNotifierProvider(
            create: (context) => getFakeUserProfileInformation()),
        ChangeNotifierProvider(create: (context) => getFakeActualForm()),
        ChangeNotifierProvider(create: (context) => getFakeCachedQuestions()),
        ChangeNotifierProvider(
            create: (context) => getFakeEditSocialProceduresSavedTypes())
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        home: widget,
      ),
    ),
  );
}
