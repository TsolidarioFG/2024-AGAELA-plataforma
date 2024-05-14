import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_profile/models/province.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef SetProvince = Province Function(Province province);

class ProvinceDropdown extends FormField<Province> {
  final List<Province> provinces;

  final Province initialState;

  final SetProvince setProvince;

  ProvinceDropdown(
      {super.key,
      required this.provinces,
      required this.initialState,
      required this.setProvince})
      : super(
            initialValue: initialState,
            builder: (FormFieldState<Province> state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextBoldStyle(
                      text: AppLocalizations.of(state.context)!
                          .editProfileLocalizationAndProfessionProvincesField),
                  DropdownMenu<Province>(
                      initialSelection: provinces.firstWhere((element) =>
                          element.provinceCode == state.value!.provinceCode),
                      dropdownMenuEntries: provinces
                          .map<DropdownMenuEntry<Province>>((Province value) {
                        return DropdownMenuEntry(
                            value: value, label: value.provinceName);
                      }).toList(),
                      onSelected: (Province? value) {
                        state.didChange(value);
                        setProvince(value!);
                      }),
                ],
              );
            });
}
