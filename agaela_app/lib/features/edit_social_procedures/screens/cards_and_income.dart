import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/list_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CardsAndIncome extends StatefulWidget {
  const CardsAndIncome({super.key});

  @override
  State<CardsAndIncome> createState() => _CardsAndIncomeState();
}

class _CardsAndIncomeState extends State<CardsAndIncome> {
  List<Map<String, String>> _cardsAndIncomeTypes = [];

  final List<String> _cardsAndIncomeTitles = [];

  final EditSocialProceduresService _editSocialProceduresService =
      locator<EditSocialProceduresService>();

  Future<List<Map<String, String>>>? _getCardsAndIncomeTypesRequest;

  @override
  void didChangeDependencies() {
    _cardsAndIncomeTitles.addAll([
      AppLocalizations.of(context)!
          .editSocialProceduresCardsAndIncomeHealthCardTitle,
      AppLocalizations.of(context)!
          .editSocialProceduresCardsAndIncomeParkingCardTitle,
      AppLocalizations.of(context)!
          .editSocialProceduresCardsAndIncomeNetIncomeTitle
    ]);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _getCardsAndIncomeTypesRequest =
        _editSocialProceduresService.getCardsAndIncomeTypes();
    _getCardsAndIncomeTypesRequest!.then(
        (cardsAndIncomesList) => _cardsAndIncomeTypes = cardsAndIncomesList,
        onError: (_) => showDefaultAlertDialog(
            context,
            const Icon(Icons.error),
            AppLocalizations.of(context)!
                .editSocialProceduresErrorCardsAndIncome,
            () => context.goNamed(RoutesNames.editSocialProcedures.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text:
            '${AppLocalizations.of(context)!.editSocialProceduresCardsAndIncomeTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
      ),
      body: FutureBuilder(
        future: _getCardsAndIncomeTypesRequest,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _cardsAndIncomeTypes.length,
                  itemBuilder: (BuildContext context, int cardsAndIncomeIndex) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextBoldStyle(
                            text: _cardsAndIncomeTitles[cardsAndIncomeIndex]),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount:
                              _cardsAndIncomeTypes[cardsAndIncomeIndex].length,
                          itemBuilder: (BuildContext context, int typeIndex) {
                            String title =
                                _cardsAndIncomeTypes[cardsAndIncomeIndex]
                                    .values
                                    .elementAt(typeIndex);
                            return ListTile(
                              title: ListButton(
                                onPressed: () => {},
                                text: title,
                                selected: false,
                              ),
                            );
                          },
                        )
                      ],
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: DefaultSendCancelButtons(
          sendFunction: null,
          cancelFunction: () => GoRouter.of(context).pop(),
        ),
      ),
    );
  }
}
