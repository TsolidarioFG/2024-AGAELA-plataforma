import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:flutter/material.dart';

class TextAppbar extends AppBar {
  final String text;

  TextAppbar({super.key, required this.text})
      : super(
            title: TextBoldStyle(
              text: text,
            ),
            automaticallyImplyLeading: false);
}
