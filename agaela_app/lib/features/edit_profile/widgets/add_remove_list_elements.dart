import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_profile/widgets/add_button_list.dart';
import 'package:agaela_app/features/edit_profile/widgets/icon_button_edit_profile.dart';
import 'package:flutter/material.dart';

class AddRemoveListElements extends FormField<List> {
  final List elements;

  final String title;

  final Function onRemove;

  final Function onAdded;

  final String? Function(String?)? elementValidator;

  AddRemoveListElements(
      {super.key,
      required this.elements,
      required this.title,
      required this.onAdded,
      required this.onRemove,
      required this.elementValidator})
      : super(
            initialValue: elements.sublist(0),
            builder: (FormFieldState<List> state) {
              void removeElement(int index, FormFieldState<List> state) {
                onRemove(index);
                state.value!.removeAt(index);
                state.didChange(state.value!);
              }

              return Column(
                children: <Widget>[
                  TextBoldStyle(
                    text: title,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    physics: const ClampingScrollPhysics(),
                    itemCount: state.value!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: TextBoldStyle(
                                text: state.value![index].toString()),
                          ),
                          Expanded(
                            child: IconButtonEditProfile(
                              function: () => removeElement(index, state),
                              newIcon: const Icon(Icons.remove),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const Divider(),
                  AddButtonList(
                      elementValidator: elementValidator,
                      state: state,
                      onAdded: onAdded)
                ],
              );
            });
}
