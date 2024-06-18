import 'package:agaela_app/common_widgets/list_button.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class YesNoListButton extends StatefulWidget {
  const YesNoListButton(
      {super.key,
      required this.selected,
      required this.title,
      required this.onPressed});

  final bool selected;

  final String title;

  final VoidCallback onPressed;

  @override
  State<YesNoListButton> createState() => _YesNoListButtonState();
}

class _YesNoListButtonState extends State<YesNoListButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextBoldStyle(text: widget.title),
        ListTile(
          title: ListButton(
            onPressed: widget.onPressed,
            selected: widget.selected,
            text: AppLocalizations.of(context)!.commonYesText,
          ),
        ),
        ListTile(
          title: ListButton(
            onPressed: widget.onPressed,
            selected: !widget.selected,
            text: AppLocalizations.of(context)!.commonNoText,
          ),
        ),
      ],
    );
  }
}
