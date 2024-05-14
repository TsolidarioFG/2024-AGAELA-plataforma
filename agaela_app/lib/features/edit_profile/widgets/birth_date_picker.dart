import 'package:agaela_app/common_widgets/text_bold_style.dart';
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
              return Row(
                children: <Widget>[
                  TextBoldStyle(
                    text: AppLocalizations.of(state.context)!
                        .editProfileIdentificationAndContactBirthDateField,
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: dateController,
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
                  ))
                ],
              );
            });

  final TextEditingController dateController;

  final Function onChanged;

  final DateTime initialState;
}
