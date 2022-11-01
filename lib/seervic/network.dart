import 'dart:convert';

import 'package:http/http.dart';
import 'package:parshing_/model/empOne.dart';

class Network {
  // Http domen
  static String Base = 'dummy.restapiexample.com';
  //  Http api
  static String Api = '/api/v1/employee/1';

  // Http request
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(Base, api, params);
    var response = await get(uri);

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // Http params

  static Map<String, String> paramsNotempty() {
    Map<String, String> params = {};
    return params;
  }

  // Http parshing

  static Empone parshingg(String response) {
    dynamic json = jsonDecode(response);
    var data = Empone.fromJson(json);
    return data;
  }
}
