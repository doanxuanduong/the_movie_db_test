import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:the_movie/common/network/configs.dart';

class AppClient {
  AppClient();

  Future<Map> get(
    String endPoint) async {
    var url = Uri.parse('${Configurations.host}$endPoint');
    Response? response;
    try {
      response = await http.get(url, headers: {});
      var data = json.decode(response.body);
      return data;
    } catch (e) {
      return {};
    }
  }

  Future<Map> post(
    String endPoint, {
    dynamic body,
  }) async {
    var url = Uri.parse('${Configurations.host}$endPoint');
    Response? response;
    Map<String, dynamic> data = {};
    try {
      response = await http.post(url, body:body);
      data = json.decode(response.body);
      return data;
    } catch(e){
      return {};
    }
  }


}
