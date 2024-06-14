import 'package:agaela_app/utils/token_utils.dart';

Future<Map<String, String>> authHeaders() async {
  String? token = await getToken();
  return <String, String>{'X-Token': '$token'};
}

Future<Map<String, String>> headersAuthAndJson() async {
  String? token = await getToken();
  return <String, String>{
    'Content-Type': 'application/json',
    'X-Token': '$token'
  };
}

const jsonHeaders = <String, String>{'Content-Type': 'application/json'};
