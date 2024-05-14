import 'package:agaela_app/features/edit_profile/widgets/icon_button_edit_profile.dart';
import 'package:flutter/material.dart';

class AddButtonList extends StatefulWidget {
  final String? Function(String?)? elementValidator;

  final FormFieldState<List> state;

  final Function onAdded;

  const AddButtonList(
      {super.key,
      required this.elementValidator,
      required this.state,
      required this.onAdded});

  @override
  State<AddButtonList> createState() => _AddButtonListState();
}

class _AddButtonListState extends State<AddButtonList> {
  bool _plusButtonPressed = false;

  final _controller = TextEditingController();

  String? _errorText;

  void _pressPlusButton() {
    setState(() {
      _plusButtonPressed = !_plusButtonPressed;
    });
  }

  void _closeAddElement() {
    _pressPlusButton();
    _controller.text = '';
  }

  void _addElement(element) {
    if (widget.elementValidator!(_controller.text) == null) {
      widget.onAdded(element);
      try {
        widget.state.value!.add(element);
      } catch (_) {
        widget.state.value!.add(int.tryParse(element));
      }
      widget.state.didChange(widget.state.value!);
      _closeAddElement();
    }
  }

  void _validate(String text) {
    setState(() {
      _errorText = widget.elementValidator!(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _plusButtonPressed
        ? Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                controller: _controller,
                onChanged: _validate,
                decoration: InputDecoration(errorText: _errorText),
              )),
              Expanded(
                child: IconButtonEditProfile(
                    function: () => _addElement(_controller.text),
                    newIcon: const Icon(Icons.add)),
              ),
              Expanded(
                child: IconButtonEditProfile(
                  function: () => _closeAddElement(),
                  newIcon: const Icon(Icons.close),
                ),
              )
            ],
          )
        : IconButtonEditProfile(
            function: () => _pressPlusButton(), newIcon: const Icon(Icons.add));
  }
}
