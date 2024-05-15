import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class BirthDatePicker extends FormField<DateTime> {
  BirthDatePicker(
      {super.key,
      required this.dateController,
      required this.onChanged,
      required this.initialState})
      : super(
            initialValue: initialState,
            builder: (FormFieldState<DateTime> state) {
              return Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: AppLocalizations.of(state.context)!
                            .editProfileIdentificationAndContactBirthDateField,
                        errorMaxLines: 3),
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                    ),
                    onTap: () async {
                      DateTime today = DateTime.now();
                      final DateTime? picked = await showDatePicker(
                        context: state.context,
                        initialDate: state.value,
                        firstDate:
                            today.subtract(const Duration(days: 365 * 100)),
                        lastDate: today,
                      );
                      if (picked != null && picked != state.value) {
                        onChanged(picked);
                        state.didChange(picked);
                        DateFormat formatter = DateFormat('dd/MM/yyyy');
                        dateController.text = formatter.format(state.value!);
                      }
                    },
                  ));
            });

  final TextEditingController dateController;

  final Function onChanged;

  final DateTime initialState;
}
