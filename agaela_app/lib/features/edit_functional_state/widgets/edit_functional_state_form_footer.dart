import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/default_cancel_button.dart';
import 'package:agaela_app/features/edit_functional_state/widgets/no_changes_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class EditFunctionalStateFormFooter extends StatefulWidget {
  const EditFunctionalStateFormFooter(
      {super.key, required this.noChangesFunction});

  final VoidCallback? noChangesFunction;

  @override
  State<EditFunctionalStateFormFooter> createState() =>
      _EditFunctionalStateFormFooterState();
}

class _EditFunctionalStateFormFooterState
    extends State<EditFunctionalStateFormFooter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: DefaultButton(
            function: null,
            text: AppLocalizations.of(context)!.commonSendButtonText,
          ),
        ),
        Expanded(
          child: NoChangesButton(noChangesFunction: widget.noChangesFunction),
        ),
        Expanded(
            child: DefaultCancelButton(
          cancelFunction: () => GoRouter.of(context).pop(),
        ))
      ],
    );
  }
}
