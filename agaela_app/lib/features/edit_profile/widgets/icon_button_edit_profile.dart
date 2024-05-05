import 'package:flutter/material.dart';

class IconButtonEditProfile extends IconButton {
  final VoidCallback function;

  final Icon newIcon;

  IconButtonEditProfile(
      {super.key, required this.function, required this.newIcon})
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
            icon: newIcon);
}
