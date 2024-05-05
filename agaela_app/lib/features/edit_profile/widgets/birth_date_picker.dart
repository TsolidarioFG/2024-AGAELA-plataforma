import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class BirthDatePicker extends StatefulWidget {
  const BirthDatePicker({super.key, required this.dateController});

  final TextEditingController dateController;

  @override
  State<BirthDatePicker> createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    UserProfileInformation userInformation =
        Provider.of<UserProfileInformationProvider>(context, listen: false)
            .userProfileInformation!;
    _selectedDate = userInformation.birthDate;
    widget.dateController.text = _selectedDate.toIso8601String();
  }

  void _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: today.subtract(const Duration(days: 365 * 100)),
      lastDate: today,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.dateController.text = _selectedDate.toIso8601String();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!
              .editProfileIdentificationAndContactBirthDateField,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
            child: TextFormField(
          controller: widget.dateController,
          onTap: () => _selectDate(context),
        ))
      ],
    );
  }
}