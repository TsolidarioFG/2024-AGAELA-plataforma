import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  const ListButton(
      {super.key,
      required this.onPressed,
      required this.selected,
      required this.text});

  final VoidCallback onPressed;

  final bool selected;

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: selected
                ? MaterialStateProperty.all<Color>(Colors.deepPurple)
                : MaterialStateProperty.all<Color>(Colors.grey),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            overlayColor: MaterialStateProperty.all<Color>(Colors.purple),
            minimumSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
            maximumSize: MaterialStateProperty.all<Size>(const Size(300, 200))),
        child: Text(
          text,
          maxLines: 5,
        ));
  }
}
