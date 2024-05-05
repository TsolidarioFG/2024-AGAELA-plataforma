import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_profile/widgets/icon_button_edit_profile.dart';
import 'package:flutter/material.dart';

class AddRemoveListElements extends StatefulWidget {
  final List elements;

  final String title;
  const AddRemoveListElements(
      {super.key, required this.elements, required this.title});

  @override
  State<AddRemoveListElements> createState() => _AddRemoveListElementsState();
}

class _AddRemoveListElementsState extends State<AddRemoveListElements> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextBoldStyle(
          text: widget.title,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.elements.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: TextBoldStyle(text: widget.elements[index].toString()),
              trailing: IconButtonEditProfile(
                function: () => {},
                newIcon: const Icon(Icons.remove),
              ),
            );
          },
        ),
        IconButtonEditProfile(
            function: () => {}, newIcon: const Icon(Icons.add)),
      ],
    );
  }
}
