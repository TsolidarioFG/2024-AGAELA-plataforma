import 'package:agaela_app/common_widgets/list_button.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/models/common_fields_model.dart';
import 'package:agaela_app/features/edit_social_procedures/widgets/yes_no_list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommonFields extends StatefulWidget {
  const CommonFields(
      {super.key,
      required this.child,
      required this.commonFieldsModel,
      required this.onChanged});

  final Widget child;

  final CommonFieldsModel commonFieldsModel;

  final VoidCallback onChanged;

  @override
  State<CommonFields> createState() => _CommonFieldsState();
}

class _CommonFieldsState extends State<CommonFields> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      TextBoldStyle(
          text:
              AppLocalizations.of(context)!.editSocialProceduresProcessedTitle),
      ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.commonFieldsModel.processedTypes.length,
          itemBuilder: (BuildContext context, int index) {
            String text =
                widget.commonFieldsModel.processedTypes.values.elementAt(index);
            String key =
                widget.commonFieldsModel.processedTypes.keys.elementAt(index);
            return ListTile(
              title: ListButton(
                onPressed: () => setState(() {
                  widget.commonFieldsModel.processedTypeSelected = key;
                  widget.onChanged();
                }),
                selected: widget.commonFieldsModel.processedTypeSelected == key,
                text: text,
              ),
            );
          }),
      YesNoListButton(
        onPressed: () => setState(() {
          widget.commonFieldsModel.notifiedUrgently =
              !widget.commonFieldsModel.notifiedUrgently;
          widget.onChanged();
        }),
        selected: widget.commonFieldsModel.notifiedUrgently,
        title: AppLocalizations.of(context)!
            .editSocialProceduresNotifiedUrgentlyTitle,
      ),
      YesNoListButton(
          onPressed: () => setState(() {
                widget.commonFieldsModel.resolutionSelected =
                    !widget.commonFieldsModel.resolutionSelected;
                widget.onChanged();
              }),
          selected: widget.commonFieldsModel.resolutionSelected,
          title: AppLocalizations.of(context)!
              .editSocialProceduresResolutionTitle),
      widget.commonFieldsModel.resolutionSelected
          ? widget.child
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextBoldStyle(
                    text: AppLocalizations.of(context)!
                        .editSocialProceduresNoResolutionTitle),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: widget
                        .commonFieldsModel.unresolvedProceduresTypes.length,
                    itemBuilder: (BuildContext context, int index) {
                      String title = widget
                          .commonFieldsModel.unresolvedProceduresTypes.values
                          .elementAt(index);
                      String key = widget
                          .commonFieldsModel.unresolvedProceduresTypes.keys
                          .elementAt(index);
                      return ListTile(
                        title: ListButton(
                          onPressed: () => setState(() {
                            widget.commonFieldsModel
                                .unresolvedProcedureSelected = key;
                            widget.onChanged();
                          }),
                          selected: widget.commonFieldsModel
                                  .unresolvedProcedureSelected ==
                              key,
                          text: title,
                        ),
                      );
                    })
              ],
            ),
    ]);
  }
}
