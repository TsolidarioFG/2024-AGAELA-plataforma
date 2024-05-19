import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/form_request_widget.dart';
import 'package:agaela_app/common_widgets/scrolleable_widget.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/utils/get_cared_name.dart';
import 'package:agaela_app/utils/go_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditFunctionalStateHome extends StatefulWidget {
  const EditFunctionalStateHome({super.key});

  @override
  State<EditFunctionalStateHome> createState() =>
      _EditFunctionalStateHomeState();
}

class _EditFunctionalStateHomeState extends State<EditFunctionalStateHome> {
  final double height = 20.0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(
          text:
              '${AppLocalizations.of(context)!.editFunctionalStateHomeTitle} ${getCaredName(context)}',
        ),
        body: ScrolleableWidget(
            child: FormRequestWidget(
          title: _title,
          formId: _formId,
          started: _startRequest,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: height,
              ),
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
              SizedBox(
                height: height,
              ),
              DefaultBackButton(backPage: () => goToHome(context))
            ],
          ),
        )));
  }
}
