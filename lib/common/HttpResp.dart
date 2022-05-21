// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class HttpResp {
  final String message;
  final String httpStatus;
  final int code;
  final String zonedDateTime;
  final String data;

  const HttpResp({
    required this.message,
    required this.httpStatus,
    required this.code,
    required this.zonedDateTime,
    required this.data,
  });

  factory HttpResp.fromJson(Map<String, dynamic> json) {
    return HttpResp(

        message: json['message'],
        httpStatus: json['httpStatus'],
        code: json['code'],
        zonedDateTime: json['zonedDateTime'],
        data: json['data']
    );
  }
}