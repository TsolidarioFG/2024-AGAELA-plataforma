import 'package:agaela_app/common_widgets/default_text_field.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:flutter/material.dart';

class DefaultNamedFormField extends StatelessWidget {
  const DefaultNamedFormField(
      {super.key,
      required this.controller,
      required this.name,
      required this.sensitiveInformation});

  final TextEditingController controller;

  final String name;

  final bool sensitiveInformation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        children: <Widget>[
          TextBoldStyle(
            text: name,
          ),
          Expanded(
            child: DefaultTextField(
                controller: controller,
                sensitiveInformation: sensitiveInformation),
          )
        ],
      ),
    );
  }
}
