import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/form_request_widget.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/constants/global_constants.dart';
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

  late final Map<String, String> _formsNames = <String, String>{};

  @override
  void initState() {
    super.initState();
    _pendingForms = Provider.of<LoggedUserProvider>(context, listen: false)
        .loggedUser!
        .pendingForms;
  }

  final ValueNotifier<String> _formId = ValueNotifier<String>('');
  final ValueNotifier<String> _title = ValueNotifier<String>('');
  final ValueNotifier<bool> _startRequest = ValueNotifier<bool>(false);

  void _startFormRequest(String formId, String title, String? code) {
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    int id = actualUser.isCarer && code! != actualUser.code
        ? (actualUser as Carer)
            .careds
            .firstWhere((careds) => careds.code == code)
            .id
        : actualUser.id;
    Provider.of<LoggedUserProvider>(context, listen: false)
        .loggedUser!
        .selectedId = id;
    setState(() {
      _formId.value = formId;
      _title.value = title;
      _startRequest.value = true;
    });
  }

  @override
  void didChangeDependencies() {
    _formsNames[ratingScaleFormId] =
        AppLocalizations.of(context)!.editFunctionalStateRatingScale;
    _formsNames[barthelIndexFormId] =
        AppLocalizations.of(context)!.editFunctionalStateBarthelIndex;
    _formsNames[caregiverOverloadFormId] =
        AppLocalizations.of(context)!.carerHomeCaregiverOverloadTitle;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(
          text: AppLocalizations.of(context)!.notificationsHomeTitle,
        ),
        body: FormRequestWidget(
            title: _title,
            formId: _formId,
            started: _startRequest,
            child: _pendingForms.isEmpty
                ? Center(
                    child: Text(AppLocalizations.of(context)!
                        .notificationsHomeNoNotifications))
                : ListView.builder(
                    itemCount: _pendingForms.length,
                    itemBuilder: (BuildContext context, int index) {
                      String formId = _pendingForms[index].formId;
                      String formTitle = _formsNames[formId]!;
                      String formText = _pendingForms[index].formText;
                      LoggedUser actualUser = Provider.of<LoggedUserProvider>(
                              context,
                              listen: false)
                          .loggedUser!;
                      return ListTile(
                        leading: const Icon(Icons.notification_important),
                        title: DefaultButton(
                            function: () => _startFormRequest(
                                formId,
                                formTitle,
                                actualUser.isCarer &&
                                        (_pendingForms[index]
                                                    as PendingFormCarer)
                                                .partnerCode !=
                                            null
                                    ? (_pendingForms[index] as PendingFormCarer)
                                        .partnerCode
                                    : actualUser.code),
                            text: formText),
                      );
                    })),
        bottomNavigationBar: BottomAppBar(
          child: DefaultBackButton(backPage: () => goToHome(context)),
        ));
  }
}
