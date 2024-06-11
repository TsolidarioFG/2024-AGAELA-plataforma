import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:agaela_app/features/edit_profile/models/province.dart';
import 'package:agaela_app/features/edit_profile/models/user_profile_information.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';
import 'package:agaela_app/utils/token_utils.dart';
import 'package:http/http.dart' as http;

String _userProfileInformationPath(code) => '/socio/$code';

const _getCountriesPath = '/ubicaciones/paises';

const _getProvincesPath = '/ubicaciones/provincias';

Future<Map<String, String>> _authHeaders() async {
  String? token = await getToken();
  return <String, String>{'X-Token': '$token'};
}

Future<Map<String, String>> _jsonAuthHeaders() async {
  String? token = await getToken();
  return <String, String>{
    'Content-Type': 'application/json',
    'X-Token': '$token'
  };
}

class EditProfileServiceImpl implements EditProfileService {
  @override
  Future<List<Country>> getCountries() async {
    final response = await http.get(Uri.parse('$baseUrl$_getCountriesPath'),
        headers: await _authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      Iterable countries = json['data'];
      return List<Country>.from(
          countries.map((country) => Country.fromJson(country)));
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Province>> getProvinces(int countryCode) async {
    final response = await http.get(Uri.parse('$baseUrl$_getProvincesPath'),
        headers: await _authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      Iterable provinces = json['data'];
      return List<Province>.from(
          provinces.map((province) => Province.fromJson(province)));
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserProfileInformation> getUserProfileInformation(String code) async {
    final response = await http.get(
        Uri.parse('$baseUrl${_userProfileInformationPath(code)}'),
        headers: await _authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      return UserProfileInformation.fromJson(json['data']);
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> setUserProfileInformation(
      String code, UserProfileInformation userInformation) async {
    final response = await http.put(
        Uri.parse('$baseUrl${_userProfileInformationPath(code)}'),
        headers: await _jsonAuthHeaders(),
        body: jsonEncode(userInformation.toJson()));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
