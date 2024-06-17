import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/utils/common_headers.dart';
import 'package:http/http.dart' as http;

const _getHealthCardTypesPath = '/tiposTarjetaSanitaria';
const _getNetIncomeTypesPath = '/tiposIngresosNetos';
const _getParkingCardTypesPath = '/tiposTarjetaEstacionamiento';

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
}
