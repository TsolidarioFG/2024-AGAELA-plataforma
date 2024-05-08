import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key,
      required this.controller,
      this.text,
      required this.sensitiveInformation,
      this.validator});

  final TextEditingController controller;

  final String? text;

  final bool sensitiveInformation;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: sensitiveInformation,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: text,
      ),
      style: const TextStyle(
        decoration: TextDecoration.none,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.errorEmptyField;
        }
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
    );
  }
}
