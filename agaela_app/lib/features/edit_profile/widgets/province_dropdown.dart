import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_profile/models/province.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProvinceDropdown extends StatefulWidget {
  final List<Province> provinces;

  final Province initialValue;

  const ProvinceDropdown({
    super.key,
    required this.provinces,
    required this.initialValue,
  });

  @override
  State<ProvinceDropdown> createState() => _ProvinceDropdownState();
}

class _ProvinceDropdownState extends State<ProvinceDropdown> {
  late Province _dropdownValue;

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget.initialValue;
  }

  void changeDropdownValue(Province? value) {
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
                .editProfileLocalizationAndProfessionProvincesField),
        DropdownMenu<Province>(
            initialSelection: widget.provinces.firstWhere((element) =>
                element.provinceCode == _dropdownValue.provinceCode),
            dropdownMenuEntries: widget.provinces
                .map<DropdownMenuEntry<Province>>((Province value) {
              return DropdownMenuEntry(value: value, label: value.provinceName);
            }).toList(),
            onSelected: (Province? value) {
              changeDropdownValue(value);
            }),
      ],
    );
  }
}
