import 'package:agaela_app/common_widgets/default_text_field.dart';
import 'package:flutter/material.dart';

class EditProfileTextField extends StatelessWidget {
  final TextEditingController controller;

  final String text;

  final String? Function(String?)? validator;

  const EditProfileTextField(
      {super.key,
      required this.controller,
      required this.text,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: DefaultTextField(
        controller: controller,
        text: text,
        validator: validator,
      ),
    );
  }
}
