import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/edit_social_procedures/models/cards_and_income_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/disability_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/permanent_work_disability_model.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/utils/common_headers.dart';
import 'package:http/http.dart' as http;

const _getHealthCardTypesPath = '/tiposTarjetaSanitaria';
const _getNetIncomeTypesPath = '/tiposIngresosNetos';
const _getParkingCardTypesPath = '/tiposTarjetaEstacionamiento';

_getPreviousAnswersAndSetCardsAndIncomePath(String partnerCode) =>
    '/socio/tarjetasIngresos/$partnerCode';

const _getProcessedTypesPath = '/tiposTramitado';
const _getResolvedDisabilityTypesPath = '/tiposIncapacidadResuelta';
const _getUnresolvedProceduresTypesPath = '/tiposTramitesNoResuelto';

_getPreviousAnswersAndSetPermanentWorkDisabilityPath(String partnerCode) =>
    '/socio/incapacidad/$partnerCode';

_getPreviousAnswersAndSetDisabilityPath(String partnerCode) =>
    '/socio/discapacidad/$partnerCode';

class EditSocialProceduresServiceImpl implements EditSocialProceduresService {
  Future<Map<String, String>> _getMap(String path) async {
    final response = await http.get(Uri.parse('$baseUrl$path'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      Map<String, String> types = {};
      Iterable typesList = json['data'];
      for (Map<String, dynamic> type in typesList) {
        String id = type['id'] as String;
        String name = type['nombre'] as String;
        types[id] = name;
      }
      return types;
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, String>> getHealthCardTypes() async {
    return _getMap(_getHealthCardTypesPath);
  }

  @override
  Future<Map<String, String>> getNetIncomeCardTypes() async {
    return _getMap(_getNetIncomeTypesPath);
  }

  @override
  Future<Map<String, String>> getParkingCardTypes() async {
    return _getMap(_getParkingCardTypesPath);
  }

  @override
  Future<CardsAndIncomeModel> getCardsAndIncomeTypes(String partnerCode) async {
    Map<String, String> healthCardTypes = await getHealthCardTypes();
    Map<String, String> parkingCardTypes = await getParkingCardTypes();
    Map<String, String> netIncomeCardTypes = await getNetIncomeCardTypes();
    CardsAndIncomeModel answers =
        await getPreviousCardsAndIncomeAnswers(partnerCode);
    CardsAndIncomeModel cardsAndIncomeModel = CardsAndIncomeModel();
    cardsAndIncomeModel.healthCardTypes = healthCardTypes;
    cardsAndIncomeModel.parkingCardTypes = parkingCardTypes;
    cardsAndIncomeModel.netIncomeTypes = netIncomeCardTypes;
    cardsAndIncomeModel.healthCardTypeSelected = answers.healthCardTypeSelected;
    cardsAndIncomeModel.netIncomeTypeSelected = answers.netIncomeTypeSelected;
    cardsAndIncomeModel.parkingCardTypeSelected =
        answers.parkingCardTypeSelected;
    return cardsAndIncomeModel;
  }

  @override
  Future<CardsAndIncomeModel> getPreviousCardsAndIncomeAnswers(
      String partnerCode) async {
    final response = await http.get(
        Uri.parse(
            '$baseUrl${_getPreviousAnswersAndSetCardsAndIncomePath(partnerCode)}'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      dynamic jsonResponseMap = json['data'];
      if (jsonResponseMap == null ||
          (jsonResponseMap is List && jsonResponseMap.isEmpty)) {
        return CardsAndIncomeModel();
      }
      return CardsAndIncomeModel.fromJson(
          jsonResponseMap as Map<String, dynamic>);
    } else {
      return CardsAndIncomeModel();
    }
  }

  @override
  Future<void> setCardsAndIncome(
      String partnerCode, CardsAndIncomeModel cardsAndIncomeTypes) async {
    final response = await http.post(
        Uri.parse(
            '$baseUrl${_getPreviousAnswersAndSetCardsAndIncomePath(partnerCode)}'),
        headers: await headersAuthAndJson(),
        body: jsonEncode(cardsAndIncomeTypes.toJson()));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<Map<String, String>> getProcessedTypes() async {
    return _getMap(_getProcessedTypesPath);
  }

  @override
  Future<Map<String, String>> getResolvedDisabilityTypes() async {
    return _getMap(_getResolvedDisabilityTypesPath);
  }

  @override
  Future<Map<String, String>> getUnresolvedProceduresTypes() async {
    return _getMap(_getUnresolvedProceduresTypesPath);
  }

  @override
  Future<PermanentWorkDisabilityModel> getPermanentWorkDisabilityField(
      String partnerCode) async {
    Map<String, String> processedTypes = await getProcessedTypes();
    Map<String, String> resolvedDisabilityTypes =
        await getResolvedDisabilityTypes();
    Map<String, String> unresolvedProceduresTypes =
        await getUnresolvedProceduresTypes();
    PermanentWorkDisabilityModel answers =
        await getPreviousPermanentWorkDisabilityAnswers(partnerCode);
    PermanentWorkDisabilityModel permanentWorkDisabilityModel =
        PermanentWorkDisabilityModel();
    permanentWorkDisabilityModel.processedTypes = processedTypes;
    permanentWorkDisabilityModel.resolvedDisabilityTypes =
        resolvedDisabilityTypes;
    permanentWorkDisabilityModel.unresolvedProceduresTypes =
        unresolvedProceduresTypes;
    permanentWorkDisabilityModel.notifiedUrgently = answers.notifiedUrgently;
    permanentWorkDisabilityModel.resolutionSelected =
        answers.resolutionSelected;
    permanentWorkDisabilityModel.processedTypeSelected =
        answers.processedTypeSelected;
    permanentWorkDisabilityModel.resolvedDisabilitySelected =
        answers.resolvedDisabilitySelected;
    permanentWorkDisabilityModel.unresolvedProcedureSelected =
        answers.unresolvedProcedureSelected;
    return permanentWorkDisabilityModel;
  }

  @override
  Future<void> setPermanentWorkDisability(String partnerCode,
      PermanentWorkDisabilityModel permanentWorkDisability) async {
    final response = await http.post(
        Uri.parse(
            '$baseUrl${_getPreviousAnswersAndSetPermanentWorkDisabilityPath(partnerCode)}'),
        headers: await headersAuthAndJson(),
        body: jsonEncode(permanentWorkDisability.toJson()));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<PermanentWorkDisabilityModel>
      getPreviousPermanentWorkDisabilityAnswers(String partnerCode) async {
    final response = await http.get(
        Uri.parse(
            '$baseUrl${_getPreviousAnswersAndSetPermanentWorkDisabilityPath(partnerCode)}'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      dynamic jsonResponseMap = json['data'];
      if (jsonResponseMap == null ||
          (jsonResponseMap is List && jsonResponseMap.isEmpty)) {
        return PermanentWorkDisabilityModel();
      }
      return PermanentWorkDisabilityModel.fromJson(
          jsonResponseMap as Map<String, dynamic>);
    } else {
      return PermanentWorkDisabilityModel();
    }
  }

  @override
  Future<DisabilityModel> getDisabilityFields() async {
    Map<String, String> processedTypes = await getProcessedTypes();
    Map<String, String> unresolvedProceduresTypes =
        await getUnresolvedProceduresTypes();
    DisabilityModel disabilityModel = DisabilityModel();
    disabilityModel.processedTypes = processedTypes;
    disabilityModel.unresolvedProceduresTypes = unresolvedProceduresTypes;
    return disabilityModel;
  }

  @override
  Future<void> setDisability(
      String partnerCode, DisabilityModel disability) async {
    final response = await http.post(
        Uri.parse(
            '$baseUrl${_getPreviousAnswersAndSetDisabilityPath(partnerCode)}'),
        headers: await headersAuthAndJson(),
        body: jsonEncode(disability.toJson()));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
