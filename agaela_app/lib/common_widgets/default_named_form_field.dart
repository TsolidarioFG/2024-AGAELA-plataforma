import 'package:agaela_app/common_widgets/default_text_field.dart';
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
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
