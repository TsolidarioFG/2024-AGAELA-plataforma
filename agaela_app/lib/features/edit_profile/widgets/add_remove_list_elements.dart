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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextBoldStyle(
                    text: title,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: state.value!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
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
                              )
                            ],
                          ));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: AddButtonList(
                        elementValidator: elementValidator,
                        state: state,
                        onAdded: onAdded),
                  )
                ],
              );
            });
}
