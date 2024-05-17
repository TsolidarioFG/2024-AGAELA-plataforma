import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form_provider.dart';
import 'package:agaela_app/features/edit_functional_state/widgets/edit_functional_state_form_footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditFunctionalStateForm extends StatefulWidget {
  const EditFunctionalStateForm({super.key});

  @override
  State<EditFunctionalStateForm> createState() =>
      _EditFunctionalStateFormState();
}

class _EditFunctionalStateFormState extends State<EditFunctionalStateForm> {
  late String _title;

  @override
  void initState() {
    ActualForm actualForm =
        Provider.of<ActualFormProvider>(context, listen: false).actualForm!;
    super.initState();
    _title = actualForm.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(text: _title),
      bottomNavigationBar:
          const EditFunctionalStateFormFooter(noChangesFunction: null),
    );
  }
}
