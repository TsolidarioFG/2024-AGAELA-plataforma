import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsHome extends StatelessWidget {
  const NotificationsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text: AppLocalizations.of(context)!.notificationsHomeTitle,
      ),
    );
  }
}
