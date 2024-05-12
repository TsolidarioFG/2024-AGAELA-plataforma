import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaredsDropdown extends StatefulWidget {
  const CaredsDropdown({super.key});

  @override
  State<CaredsDropdown> createState() => _CaredsDropdownState();
}

class _CaredsDropdownState extends State<CaredsDropdown> {
  late List<Cared> _careds;

  late Carer _carer;

  late Cared _dropdownValue;

  void _setSelectedUserId(int selectedUserId) {
    Carer newCarer = Carer(_carer.careds, _carer.id, _carer.name,
        _carer.pendingForms, _carer.isCarer, selectedUserId);
    Provider.of<LoggedUserProvider>(context, listen: false)
        .setLoggedUser(newCarer);
  }

  @override
  void initState() {
    super.initState();
    _carer = Provider.of<LoggedUserProvider>(context, listen: false).loggedUser
        as Carer;
    _careds = _carer.careds;
    _dropdownValue = _careds.first;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setSelectedUserId(_dropdownValue.id);
    });
  }

  void _changeDropdownValue(Cared? value) {
    setState(() {
      _dropdownValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _careds.length == 1
        ? TextBoldStyle(text: '${_careds.first.name} ${_careds.first.lastName}')
        : DropdownMenu<Cared>(
            initialSelection: _dropdownValue,
            dropdownMenuEntries:
                _careds.map<DropdownMenuEntry<Cared>>((Cared value) {
              return DropdownMenuEntry(
                  value: value, label: '${value.name} ${value.lastName}');
            }).toList(),
            onSelected: (Cared? value) {
              _setSelectedUserId(value!.id);
              _changeDropdownValue(value);
            });
  }
}
