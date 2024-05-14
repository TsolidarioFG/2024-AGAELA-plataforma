import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReportIncidentTextField extends StatelessWidget {
  final TextEditingController controller;

  const ReportIncidentTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        minLines: 5,
        maxLines: 5,
        controller: controller,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), errorMaxLines: 3),
        validator: (String? incident) {
          return incident == null || incident.isEmpty
              ? AppLocalizations.of(context)!.errorEmptyField
              : null;
        });
  }
}
