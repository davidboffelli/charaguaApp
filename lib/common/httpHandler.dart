import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'HttpResp.dart';

class HttpHandler{

  final String _baseUrl = 'localhost:8080/api';
  //final String _baseURL = '';
  Future<dynamic> getJson(Uri uri) async{

    http.Response response = await http.get(uri);
    return json.decode(response.body).toString();
  }

  Future<String> postToken(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {

       var json = jsonDecode(response.body);
       String jwt = json['data']['jwt'];
      //final responseJson = jsonDecode(response.body);

      return jwt;
    } else {

      throw Exception('Failed to get Token.');
    }
  }
}