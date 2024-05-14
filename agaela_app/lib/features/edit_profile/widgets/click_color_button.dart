import 'package:flutter/material.dart';

class ClickColorButton extends FormField<bool> {
  final VoidCallback function;

  final bool initialState;

  final String clickedText;

  final String notClickedText;

  ClickColorButton(
      {super.key,
      required this.function,
      required this.initialState,
      required this.clickedText,
      required this.notClickedText})
      : super(
            initialValue: initialState,
            builder: (FormFieldState<bool> state) {
              return ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: state.value!
                          ? MaterialStateProperty.all<Color>(Colors.deepPurple)
                          : MaterialStateProperty.all<Color>(Colors.grey),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      overlayColor: state.value!
                          ? MaterialStateProperty.all<Color>(Colors.purple)
                          : MaterialStateProperty.all<Color>(Colors.blueGrey),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(200, 100)),
                      maximumSize: MaterialStateProperty.all<Size>(
                          const Size(300, 200))),
                  onPressed: () => {function(), state.didChange(!state.value!)},
                  child: Text(state.value! ? clickedText : notClickedText));
            });
}
