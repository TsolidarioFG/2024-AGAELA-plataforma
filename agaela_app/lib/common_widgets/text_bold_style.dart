import 'package:flutter/material.dart';

class TextBoldStyle extends Text {
  final String text;

  const TextBoldStyle({super.key, required this.text})
      : super(text, style: const TextStyle(fontWeight: FontWeight.bold));
}
