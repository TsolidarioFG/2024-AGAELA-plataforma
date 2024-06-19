import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Disability extends StatefulWidget {
  const Disability({super.key});

  @override
  State<Disability> createState() => _DisabilityState();
}

class _DisabilityState extends State<Disability> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text:
            '${AppLocalizations.of(context)!.editSocialProceduresDisabilityTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
      ),
      bottomNavigationBar: BottomAppBar(
        child: DefaultSendCancelButtons(
          sendFunction: () => {},
          cancelFunction: () => GoRouter.of(context).pop(),
        ),
      ),
    );
  }
}
