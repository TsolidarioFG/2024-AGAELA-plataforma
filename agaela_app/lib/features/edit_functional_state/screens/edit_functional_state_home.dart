import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/form_request_widget.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/utils/go_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EditFunctionalStateHome extends StatefulWidget {
  const EditFunctionalStateHome({super.key});

  @override
  State<EditFunctionalStateHome> createState() =>
      _EditFunctionalStateHomeState();
}

class _EditFunctionalStateHomeState extends State<EditFunctionalStateHome> {
  final ValueNotifier<int> _formId = ValueNotifier<int>(-1);
  final ValueNotifier<String> _title = ValueNotifier<String>('');
  final ValueNotifier<bool> _startRequest = ValueNotifier<bool>(false);

  void _startFormRequest(String title, int formId) {
    setState(() {
      _title.value = title;
      _formId.value = formId;
      _startRequest.value = true;
    });
  }

  String getCaredName() {
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    Cared? actualCared = actualUser.getActualCared();
    if (actualCared != null) {
      return actualCared.name;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(
          text:
              '${AppLocalizations.of(context)!.editFunctionalStateHomeTitle} ${getCaredName()}',
        ),
        body: FormRequestWidget(
          title: _title,
          formId: _formId,
          started: _startRequest,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(Icons.library_add_check),
                  Expanded(
                    child: DefaultButton(
                      function: () => _startFormRequest(
                          AppLocalizations.of(context)!
                              .editFunctionalStateRatingScaleTitle,
                          ratingScaleFormId),
                      text: AppLocalizations.of(context)!
                          .editFunctionalStateRatingScale,
                    ),
                  ),
                  const Icon(Icons.edit_document),
                  Expanded(
                      child: DefaultButton(
                    function: () => _startFormRequest(
                        AppLocalizations.of(context)!
                            .editFunctionalStateBarthelIndexTitle,
                        barthelIndexFormId),
                    text: AppLocalizations.of(context)!
                        .editFunctionalStateBarthelIndex,
                  ))
                ],
              ),
              DefaultBackButton(backPage: () => goToHome(context))
            ],
          ),
        ));
  }
}
