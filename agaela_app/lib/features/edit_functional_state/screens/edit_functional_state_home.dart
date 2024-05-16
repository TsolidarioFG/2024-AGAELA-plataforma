import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/utils/go_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditFunctionalStateHome extends StatelessWidget {
  const EditFunctionalStateHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text: AppLocalizations.of(context)!.editFunctionalStateHomeTitle,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(Icons.library_add_check),
              Expanded(
                child: DefaultButton(
                  function: () => {},
                  text: AppLocalizations.of(context)!
                      .editFunctionalStateRatingScale,
                ),
              ),
              const Icon(Icons.edit_document),
              Expanded(
                  child: DefaultButton(
                function: () => {},
                text: AppLocalizations.of(context)!
                    .editFunctionalStateBarthelIndex,
              ))
            ],
          ),
          DefaultBackButton(backPage: () => goToHome(context))
        ],
      ),
    );
  }
}
