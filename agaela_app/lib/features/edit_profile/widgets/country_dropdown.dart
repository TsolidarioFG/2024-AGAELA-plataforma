import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef SetCountry = Country Function(Country country);

class CountryDropdown extends FormField<Country> {
  final List<Country> countries;

  final Country initialState;

  final Function onChanged;

  final SetCountry setCountry;

  CountryDropdown(
      {super.key,
      required this.countries,
      required this.initialState,
      required this.onChanged,
      required this.setCountry})
      : super(
            initialValue: initialState,
            builder: (FormFieldState<Country> state) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownMenu<Country>(
                    expandedInsets: EdgeInsets.zero,
                    label: Text(AppLocalizations.of(state.context)!
                        .editProfileLocalizationAndProfessionCountriesField),
                    initialSelection: countries.firstWhere(
                        (element) =>
                            element.countryCode == state.value!.countryCode,
                        orElse: () => countries.first),
                    dropdownMenuEntries: countries
                        .map<DropdownMenuEntry<Country>>((Country value) {
                      return DropdownMenuEntry(
                          value: value, label: value.countryName);
                    }).toList(),
                    onSelected: (Country? value) {
                      state.didChange(value);
                      onChanged(value!.countryCode);
                      setCountry(value);
                    }),
              );
            });
}
