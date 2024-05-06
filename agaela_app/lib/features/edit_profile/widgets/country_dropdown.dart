import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CountryDropdown extends StatefulWidget {
  final List<Country> countries;

  final Country initialValue;

  const CountryDropdown(
      {super.key, required this.countries, required this.initialValue});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  late Country _dropdownValue;

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget.initialValue;
  }

  void changeDropdownValue(Country? value) {
    setState(() {
      _dropdownValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextBoldStyle(
            text: AppLocalizations.of(context)!
                .editProfileLocalizationAndProfessionCountriesField),
        DropdownMenu<Country>(
            initialSelection: widget.countries.firstWhere(
                (element) => element.countryCode == _dropdownValue.countryCode),
            dropdownMenuEntries: widget.countries
                .map<DropdownMenuEntry<Country>>((Country value) {
              return DropdownMenuEntry(value: value, label: value.countryName);
            }).toList(),
            onSelected: (Country? value) {
              changeDropdownValue(value);
            }),
      ],
    );
  }
}
