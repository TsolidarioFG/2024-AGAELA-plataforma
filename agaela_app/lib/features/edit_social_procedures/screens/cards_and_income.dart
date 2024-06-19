import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/list_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/models/cards_and_income_model.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
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
  bool _correctValues = false;

  late CardsAndIncomeModel _cardsAndIncomeTypes;

  final EditSocialProceduresService _editSocialProceduresService =
      locator<EditSocialProceduresService>();

  Future<CardsAndIncomeModel>? _getCardsAndIncomeTypesRequest;

  Future<void>? _saveCardsAndIncomeRequest;

  Future<CardsAndIncomeModel>? _getPreviousAnswersRequest;

  void _checkCorrectValues() {
    setState(() {
      _correctValues = _cardsAndIncomeTypes.healthCardTypeSelected != null &&
          _cardsAndIncomeTypes.netIncomeTypeSelected != null &&
          _cardsAndIncomeTypes.parkingCardTypeSelected != null;
    });
  }

  void _saveCardsAndIncome() {
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    setState(() {
      _saveCardsAndIncomeRequest = _editSocialProceduresService
          .setCardsAndIncome(actualUser.getActualCode(), _cardsAndIncomeTypes);
      _saveCardsAndIncomeRequest!.then(
          (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.check),
              AppLocalizations.of(context)!
                  .editSocialProceduresCardsAndIncomeSavedChanges,
              () => context.goNamed(RoutesNames.editSocialProcedures.name)),
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.error),
              AppLocalizations.of(context)!
                  .editSocialProceduresCardsAndIncomeErrorSavingChanges,
              () => GoRouter.of(context).pop()));
    });
  }

  void _getPreviousAnswers() {
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    _getPreviousAnswersRequest = _editSocialProceduresService
        .getPreviousCardsAndIncomeAnswers(actualUser.getActualCode());
    _getPreviousAnswersRequest!.then((answers) {
      _cardsAndIncomeTypes.healthCardTypeSelected =
          answers.healthCardTypeSelected;
      _cardsAndIncomeTypes.netIncomeTypeSelected =
          answers.netIncomeTypeSelected;
      _cardsAndIncomeTypes.parkingCardTypeSelected =
          answers.parkingCardTypeSelected;
      _checkCorrectValues();
    },
        onError: (_) => showDefaultAlertDialog(
            context,
            const Icon(Icons.error),
            AppLocalizations.of(context)!
                .editSocialProceduresErrorCardsAndIncome,
            () => context.goNamed(RoutesNames.editSocialProcedures.name)));
  }

  @override
  void initState() {
    super.initState();
    _getCardsAndIncomeTypesRequest =
        _editSocialProceduresService.getCardsAndIncomeTypes();
    _getCardsAndIncomeTypesRequest!.then((cardsAndIncomes) {
      _cardsAndIncomeTypes = cardsAndIncomes;
      _getPreviousAnswers();
    },
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
          future: _getPreviousAnswersRequest,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.connectionState != ConnectionState.done
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: <Widget>[
                      TextBoldStyle(
                          text: AppLocalizations.of(context)!
                              .editSocialProceduresCardsAndIncomeHealthCardTitle),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: _cardsAndIncomeTypes.healthCardTypes.length,
                        itemBuilder: (BuildContext context, int typeIndex) {
                          String title = _cardsAndIncomeTypes
                              .healthCardTypes.values
                              .elementAt(typeIndex);
                          String key = _cardsAndIncomeTypes.healthCardTypes.keys
                              .elementAt(typeIndex);
                          String? selectedKey =
                              _cardsAndIncomeTypes.healthCardTypeSelected;
                          return ListTile(
                            title: ListButton(
                              onPressed: () {
                                setState(() {
                                  _cardsAndIncomeTypes.healthCardTypeSelected =
                                      key;
                                  _checkCorrectValues();
                                });
                              },
                              text: title,
                              selected: selectedKey == key,
                            ),
                          );
                        },
                      ),
                      TextBoldStyle(
                          text: AppLocalizations.of(context)!
                              .editSocialProceduresCardsAndIncomeParkingCardTitle),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: _cardsAndIncomeTypes.parkingCardTypes.length,
                        itemBuilder: (BuildContext context, int typeIndex) {
                          String title = _cardsAndIncomeTypes
                              .parkingCardTypes.values
                              .elementAt(typeIndex);
                          String key = _cardsAndIncomeTypes
                              .parkingCardTypes.keys
                              .elementAt(typeIndex);
                          String? selectedKey =
                              _cardsAndIncomeTypes.parkingCardTypeSelected;
                          return ListTile(
                            title: ListButton(
                              onPressed: () {
                                setState(() {
                                  _cardsAndIncomeTypes.parkingCardTypeSelected =
                                      key;
                                  _checkCorrectValues();
                                });
                              },
                              text: title,
                              selected: selectedKey == key,
                            ),
                          );
                        },
                      ),
                      TextBoldStyle(
                          text: AppLocalizations.of(context)!
                              .editSocialProceduresCardsAndIncomeNetIncomeTitle),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: _cardsAndIncomeTypes.netIncomeTypes.length,
                        itemBuilder: (BuildContext context, int typeIndex) {
                          String title = _cardsAndIncomeTypes
                              .netIncomeTypes.values
                              .elementAt(typeIndex);
                          String key = _cardsAndIncomeTypes.netIncomeTypes.keys
                              .elementAt(typeIndex);
                          String? selectedKey =
                              _cardsAndIncomeTypes.netIncomeTypeSelected;
                          return ListTile(
                            title: ListButton(
                              onPressed: () {
                                setState(() {
                                  _cardsAndIncomeTypes.netIncomeTypeSelected =
                                      key;
                                  _checkCorrectValues();
                                });
                              },
                              text: title,
                              selected: selectedKey == key,
                            ),
                          );
                        },
                      ),
                    ],
                  );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: FutureBuilder(
              future: _saveCardsAndIncomeRequest,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(child: CircularProgressIndicator())
                    : DefaultSendCancelButtons(
                        sendFunction:
                            _correctValues ? () => _saveCardsAndIncome() : null,
                        cancelFunction: () => GoRouter.of(context).pop(),
                      );
              }),
        ));
  }
}
