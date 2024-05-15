import 'package:flutter/material.dart';

class TextBoldStyle extends Text {
  final String text;

  final int? textMaxLines;

  const TextBoldStyle({super.key, required this.text, this.textMaxLines})
      : super(text,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: textMaxLines);
}
