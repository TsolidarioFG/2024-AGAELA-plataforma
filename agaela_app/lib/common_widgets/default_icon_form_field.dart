import 'package:agaela_app/common_widgets/default_text_field.dart';
import 'package:flutter/material.dart';

class DefaultIconFormField extends StatelessWidget {
  const DefaultIconFormField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.text,
      required this.sensitiveInformation,
      this.validator});

  final TextEditingController controller;

  final Icon icon;

  final String text;

  final bool sensitiveInformation;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        children: <Widget>[
          icon,
          Expanded(
            child: DefaultTextField(
              controller: controller,
              text: text,
              sensitiveInformation: sensitiveInformation,
              validator: validator,
            ),
          )
        ],
      ),
    );
  }
}
