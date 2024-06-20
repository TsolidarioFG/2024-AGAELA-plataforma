import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/list_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/models/dependency_model.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/edit_social_procedures/widgets/yes_no_list_button.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Dependency extends StatefulWidget {
  const Dependency({super.key});

  @override
  State<Dependency> createState() => _DependencyState();
}

class _DependencyState extends State<Dependency> {
  final _dependencyFormKey = GlobalKey<FormState>();

  final EditSocialProceduresService _editSocialProceduresService =
      locator<EditSocialProceduresService>();

  late DependencyModel _dependencyModel;

  Future<DependencyModel>? _dependencyFieldsRequest;

  @override
  void initState() {
    super.initState();
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    _dependencyFieldsRequest = _editSocialProceduresService
        .getDependencyFields(actualUser.getActualCode());
    _dependencyFieldsRequest!.then((dependencyFields) {
      _dependencyModel = dependencyFields;
    },
        onError: (_) => showDefaultAlertDialog(
            context,
            const Icon(Icons.error),
            AppLocalizations.of(context)!.editSocialProceduresErrorDependency,
            () => context.goNamed(RoutesNames.editSocialProcedures.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text:
            '${AppLocalizations.of(context)!.editSocialProceduresDependencyTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
      ),
      body: FutureBuilder(
        future: _dependencyFieldsRequest,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: _dependencyFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ListView(children: <Widget>[
                    TextBoldStyle(
                        text: AppLocalizations.of(context)!
                            .editSocialProceduresProcessedTitle),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: _dependencyModel.processedTypes.length,
                        itemBuilder: (BuildContext context, int index) {
                          String text = _dependencyModel.processedTypes.values
                              .elementAt(index);
                          String key = _dependencyModel.processedTypes.keys
                              .elementAt(index);
                          return ListTile(
                            title: ListButton(
                              onPressed: () => setState(() {
                                _dependencyModel.processedTypeSelected = key;
                              }),
                              selected:
                                  _dependencyModel.processedTypeSelected == key,
                              text: text,
                            ),
                          );
                        }),
                    YesNoListButton(
                      onPressed: () => setState(() {
                        _dependencyModel.notifiedUrgently =
                            !_dependencyModel.notifiedUrgently;
                      }),
                      selected: _dependencyModel.notifiedUrgently,
                      title: AppLocalizations.of(context)!
                          .editSocialProceduresNotifiedUrgentlyTitle,
                    ),
                    YesNoListButton(
                        onPressed: () => setState(() {
                              _dependencyModel.resolutionSelected =
                                  !_dependencyModel.resolutionSelected;
                            }),
                        selected: _dependencyModel.resolutionSelected,
                        title: AppLocalizations.of(context)!
                            .editSocialProceduresResolutionTitle),
                    _dependencyModel.resolutionSelected
                        ? const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextBoldStyle(
                                  text: AppLocalizations.of(context)!
                                      .editSocialProceduresNoResolutionTitle),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: _dependencyModel
                                      .unresolvedProceduresTypes.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String title = _dependencyModel
                                        .unresolvedProceduresTypes.values
                                        .elementAt(index);
                                    String key = _dependencyModel
                                        .unresolvedProceduresTypes.keys
                                        .elementAt(index);
                                    return ListTile(
                                      title: ListButton(
                                        onPressed: () => setState(() {
                                          _dependencyModel
                                                  .unresolvedProcedureSelected =
                                              key;
                                        }),
                                        selected: _dependencyModel
                                                .unresolvedProcedureSelected ==
                                            key,
                                        text: title,
                                      ),
                                    );
                                  })
                            ],
                          )
                  ]));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: DefaultSendCancelButtons(
          sendFunction: () => {},
          cancelFunction: () => GoRouter.of(context).pop(),
        ),
      ),
    );
  }
}
