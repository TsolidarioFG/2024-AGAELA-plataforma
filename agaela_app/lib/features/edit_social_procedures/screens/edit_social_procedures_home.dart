import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EditSocialProceduresHome extends StatelessWidget {
  const EditSocialProceduresHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text:
            '${AppLocalizations.of(context)!.editSocialProceduresHomeTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
      ),
    );
  }
}
