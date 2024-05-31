import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:agaela_app/features/login/models/pending_form_carer.dart';
import 'package:agaela_app/utils/go_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class NotificationsHome extends StatefulWidget {
  const NotificationsHome({super.key});

  @override
  State<NotificationsHome> createState() => _NotificationsHomeState();
}

class _NotificationsHomeState extends State<NotificationsHome> {
  late List<PendingForm> _pendingForms;

  @override
  void initState() {
    super.initState();
    _pendingForms = Provider.of<LoggedUserProvider>(context, listen: false)
        .loggedUser!
        .pendingForms;
  }

  String getNotificationCaredText(int? caredId, int formId) {
    if (caredId == null) {
      return AppLocalizations.of(context)!
          .notificationsHomePendingNotification(formId);
    } else {
      LoggedUser actualUser =
          Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
      String caredName = (actualUser as Carer)
          .careds
          .firstWhere((cared) => caredId == cared.id)
          .name;
      return AppLocalizations.of(context)!
          .notificationsHomePendingNotificationCared(formId, caredName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(
          text: AppLocalizations.of(context)!.notificationsHomeTitle,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: _pendingForms.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.notification_important),
                    title: DefaultButton(
                      function: () => {},
                      text: Provider.of<LoggedUserProvider>(context,
                                  listen: false)
                              .loggedUser!
                              .isCarer
                          ? getNotificationCaredText(
                              (_pendingForms[index] as PendingFormCarer)
                                  .caredId,
                              _pendingForms[index].formId)
                          : AppLocalizations.of(context)!
                              .notificationsHomePendingNotification(
                                  _pendingForms[index].formId),
                    ),
                  );
                }),
            DefaultBackButton(backPage: () => goToHome(context))
          ],
        ));
  }
}
