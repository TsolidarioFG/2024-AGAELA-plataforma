import 'package:flutter/material.dart';

class TextAppbar extends AppBar {
  final String text;

  TextAppbar({super.key, required this.text})
      : super(
            title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
}
