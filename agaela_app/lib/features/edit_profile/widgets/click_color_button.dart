import 'package:flutter/material.dart';

class ClickColorButton extends StatefulWidget {
  final VoidCallback function;

  final bool initialState;

  final String clickedText;

  final String notClickedText;

  const ClickColorButton(
      {super.key,
      required this.function,
      required this.initialState,
      required this.clickedText,
      required this.notClickedText});
  @override
  State<ClickColorButton> createState() => _ClickColorButtonState();
}

class _ClickColorButtonState extends State<ClickColorButton> {
  late bool _clicked;

  late String _text;

  void _changeTextByClicked() {
    _clicked ? _text = widget.clickedText : _text = widget.notClickedText;
  }

  @override
  void initState() {
    super.initState();
    _clicked = widget.initialState;
    _changeTextByClicked();
  }

  void _changeClicked() {
    setState(() {
      _clicked = !_clicked;
      _changeTextByClicked();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: _clicked
                ? MaterialStateProperty.all<Color>(Colors.deepPurple)
                : MaterialStateProperty.all<Color>(Colors.grey),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            overlayColor: _clicked
                ? MaterialStateProperty.all<Color>(Colors.purple)
                : MaterialStateProperty.all<Color>(Colors.blueGrey),
            minimumSize: MaterialStateProperty.all<Size>(const Size(200, 100)),
            maximumSize: MaterialStateProperty.all<Size>(const Size(300, 200))),
        onPressed: () => {widget.function(), _changeClicked()},
        child: Text(_text));
  }
}
