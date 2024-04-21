import 'package:flutter/material.dart';

class DefaultButton extends ElevatedButton {
  final VoidCallback function;

  final String text;

  DefaultButton({super.key, required this.function, required this.text})
      : super(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                overlayColor: MaterialStateProperty.all<Color>(Colors.purple),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(200, 100)),
                maximumSize:
                    MaterialStateProperty.all<Size>(const Size(300, 200))),
            onPressed: function,
            child: Text(text));
}
