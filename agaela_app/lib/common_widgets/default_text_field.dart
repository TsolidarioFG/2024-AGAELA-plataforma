import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key,
      required this.controller,
      this.text,
      required this.sensitiveInformation});

  final TextEditingController controller;

  final String? text;

  final bool sensitiveInformation;

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
        return (value == null || value.isEmpty)
            ? AppLocalizations.of(context)!.errorEmptyField
            : null;
      },
    );
  }
}
