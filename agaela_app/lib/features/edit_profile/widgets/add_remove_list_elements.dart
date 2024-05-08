import 'package:agaela_app/common_widgets/default_text_field.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_profile/widgets/icon_button_edit_profile.dart';
import 'package:flutter/material.dart';

class AddRemoveListElements extends StatefulWidget {
  final List elements;

  final String title;

  final Function onRemove;

  final Function onAdded;

  final String onAddedText;

  const AddRemoveListElements(
      {super.key,
      required this.elements,
      required this.title,
      required this.onAdded,
      required this.onRemove,
      required this.onAddedText});

  @override
  State<AddRemoveListElements> createState() => _AddRemoveListElementsState();
}

class _AddRemoveListElementsState extends State<AddRemoveListElements> {
  final List _actualElements = [];
  bool _plusButtonPressed = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _actualElements.addAll(widget.elements);
  }

  void _pressPlusButton() {
    setState(() {
      _plusButtonPressed = !_plusButtonPressed;
    });
  }

  void _removeElement(int index) {
    widget.onRemove(index);
    setState(() {
      _actualElements.removeAt(index);
    });
  }

  void _addElement(element) {
    widget.onAdded(element);
    setState(() {
      _actualElements.add(element);
    });
    _pressPlusButton();
    _controller.text = '';
  }

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
          itemCount: _actualElements.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: TextBoldStyle(text: _actualElements[index].toString()),
              trailing: IconButtonEditProfile(
                function: () => _removeElement(index),
                newIcon: const Icon(Icons.remove),
              ),
            );
          },
        ),
        _plusButtonPressed
            ? Row(
                children: <Widget>[
                  Expanded(
                    child: DefaultTextField(
                        controller: _controller, sensitiveInformation: false),
                  ),
                  IconButtonEditProfile(
                      function: () => _addElement(_controller.text),
                      newIcon: const Icon(Icons.add))
                ],
              )
            : IconButtonEditProfile(
                function: () => _pressPlusButton(),
                newIcon: const Icon(Icons.add)),
      ],
    );
  }
}
