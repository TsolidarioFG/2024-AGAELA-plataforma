import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/utils/common_headers.dart';
import 'package:http/http.dart' as http;

const _getHealthCardTypesPath = '/tiposTarjetaSanitaria';
const _getNetIncomeTypesPath = '/tiposIngresosNetos';
const _getParkingCardTypesPath = '/tiposTarjetaEstacionamiento';

_getPreviousAnswersAndSetCardsAndIncomePath(String partnerCode) =>
    '/socio/tarjetasIngresos/$partnerCode';

Object _setCardsAndIncomeBody(List<String> cardsAndIncomeTypesId) {
  int first = 0;
  int second = 1;
  int third = 2;
  return jsonEncode(<String, dynamic>{
    'idTipoTarjetaSanitaria': cardsAndIncomeTypesId[first],
    'idTipoTarjetaEstacionamiento': cardsAndIncomeTypesId[second],
    'idTipoIngresosNetos': cardsAndIncomeTypesId[third]
  });
}

const _getProcessedTypesPath = '/tiposTramitado';
const _getResolvedDisabilityTypesPath = '/tiposIncapacidadResuelta';
const _getUnresolvedProceduresTypesPath = '/tiposTramitesNoResuelto';

class EditSocialProceduresServiceImpl implements EditSocialProceduresService {
  Map<String, String> _getMap(Map<String, dynamic> json) {
    Map<String, String> types = {};
    Iterable typesList = json['data'];
    for (Map<String, dynamic> type in typesList) {
      String id = type['id'] as String;
      String name = type['nombre'] as String;
      types[id] = name;
    }
    return types;
  }

  @override
  Future<Map<String, String>> getHealthCardTypes() async {
    final response = await http.get(
        Uri.parse('$baseUrl$_getHealthCardTypesPath'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      return _getMap(json);
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, String>> getNetIncomeCardTypes() async {
    final response = await http.get(
        Uri.parse('$baseUrl$_getNetIncomeTypesPath'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      return _getMap(json);
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, String>> getParkingCardTypes() async {
    final response = await http.get(
        Uri.parse('$baseUrl$_getParkingCardTypesPath'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      return _getMap(json);
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Map<String, String>>> getCardsAndIncomeTypes() async {
    Map<String, String> healthCardTypes = await getHealthCardTypes();
    Map<String, String> parkingCardTypes = await getParkingCardTypes();
    Map<String, String> netIncomeCardTypes = await getNetIncomeCardTypes();
    return List.from([healthCardTypes, parkingCardTypes, netIncomeCardTypes]);
  }

  @override
  Future<List<String>> getPreviousCardsAndIncomeAnswers(
      String partnerCode) async {
    String incorrectValue = '-1';
    final response = await http.get(
        Uri.parse(
            '$baseUrl${_getPreviousAnswersAndSetCardsAndIncomePath(partnerCode)}'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      Map<String, dynamic>? jsonResponseMap =
          json['data'] as Map<String, dynamic>?;
      if (jsonResponseMap == null || jsonResponseMap.isEmpty) {
        return [];
      }
      String healthCardId;
      String parkingCardId;
      String netIncomeId;
      Map<String, dynamic>? healthCardMap =
          json['data']['tarjetaSanitaria'] as Map<String, dynamic>?;
      Map<String, dynamic>? parkingCardMap =
          json['data']['tarjetaEstacionamiento'] as Map<String, dynamic>?;
      Map<String, dynamic>? netIncomeMap =
          json['data']['ingresosNetos'] as Map<String, dynamic>?;
      if (healthCardMap == null) {
        healthCardId = incorrectValue;
      } else {
        healthCardId = healthCardMap['id'] as String;
      }
      if (parkingCardMap == null) {
        parkingCardId = incorrectValue;
      } else {
        parkingCardId = parkingCardMap['id'] as String;
      }
      if (netIncomeMap == null) {
        netIncomeId = incorrectValue;
      } else {
        netIncomeId = netIncomeMap['id'] as String;
      }
      return List<String>.from([healthCardId, parkingCardId, netIncomeId]);
    } else {
      return [];
    }
  }

  @override
  Future<void> setCardsAndIncome(
      String partnerCode, List<String> cardsAndIncomeTypesId) async {
    final response = await http.post(
        Uri.parse(
            '$baseUrl${_getPreviousAnswersAndSetCardsAndIncomePath(partnerCode)}'),
        headers: await headersAuthAndJson(),
        body: _setCardsAndIncomeBody(cardsAndIncomeTypesId));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<Map<String, String>> getProcessedTypes() async {
    final response = await http.get(
        Uri.parse('$baseUrl$_getProcessedTypesPath'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      return _getMap(json);
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, String>> getResolvedDisabilityTypes() async {
    final response = await http.get(
        Uri.parse('$baseUrl$_getResolvedDisabilityTypesPath'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      return _getMap(json);
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, String>> getUnresolvedProceduresTypes() async {
    final response = await http.get(
        Uri.parse('$baseUrl$_getUnresolvedProceduresTypesPath'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      return _getMap(json);
    } else {
      throw Exception();
    }
  }
}
