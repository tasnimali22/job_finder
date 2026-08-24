import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  String baseUrl = "https://project2.amit-learning.com/api";
  Future<Map<String, dynamic>> get({
    required String url,
    required String token,
    Map<dynamic, dynamic>? body,
  }) async {
    Map<String, String> header = {};
    header.addAll({
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    });
    http.Response response = await http.get(
      Uri.parse("$baseUrl$url"),
      headers: header,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("there is a proplem is a statuecod ${response.body}");
    }
  }

  Future<Map<String, dynamic>> post({
    required String url,
    required dynamic body,
    required String? token,
  }) async {
    Map<String, String> header = {};

    header.addAll({
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    });
    http.Response response = await http.post(
      Uri.parse("$baseUrl$url"),
      body: body,
      headers: header,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        "there is a proplem is a statuecod ${response.statusCode} and ${jsonDecode(response.body)}",
      );
    }
  }

  Future<http.Response> postWithFiles({
    required String url,
    required Map<String, String> body,
    required List<http.MultipartFile> files,
    required String? token,
  }) async {
    Map<String, String> header = {};

    header.addAll({
      "Authorization": "Bearer $token",
      "Accept": "application/json",
    });
    final request = http.MultipartRequest("POST", Uri.parse("$baseUrl$url"));
    request.headers.addAll(header);

    request.files.addAll(files);
    request.fields.addAll(body);

    final stream = await request.send();
    final response = await http.Response.fromStream(stream);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
        "there is a proplem is a statuecod ${response.statusCode} and ${response.body}",
      );
    }
  }

  Future<Map<String, dynamic>> put({
    required String url,
    required dynamic body,
    required String token,
  }) async {
    Map<String, String> header = {};
    header.addAll({"Content-Type": "application/x-www-form-urlencoded"});

    header.addAll({"Authorzation": "Bearer $token"});
    http.Response response = await http.put(
      Uri.parse("$baseUrl$url"),
      body: body,
      headers: header,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        "there is a proplem is a statuecod ${response.statusCode} and ${jsonDecode(response.body)}",
      );
    }
  }
}
