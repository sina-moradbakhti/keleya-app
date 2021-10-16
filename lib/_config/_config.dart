import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InAppConfig {
  // Localizations
  static const String localization_path = 'assets/translation';
  static const List<Locale> localizations = [
    Locale('en', 'US'),
    Locale('de', 'DE')
  ];
  // Http Service
  static const String saltPattern =
      '.a_b-cd!efghij@klmnop'; // it uses for generate a salty passwords
  static const String services_host_url = 'http://localhost:3000';
  static String fresh_jwt_token =
      ''; // it will update by every token which recieve from server
}

/* ------------------------------ */
/* ------------------------------ */
/* ------------------------------ */
/* HTTP SERVICE CLASS & FUNCTIONS */
/* ------------------------------ */
/* ------------------------------ */
/* ------------------------------ */

enum HttpServiceRequestType { GET, POST, PATCH }

abstract class HttpService extends HttpServiceUtils {
  final String host = InAppConfig.services_host_url;

  Future<HttpServiceResponse> call();
}

class HttpServiceResponse extends HttpServiceUtils {
  int statusCode = 0;
  Map<String, dynamic> result = {};
  HttpServiceResponse(http.Response response) {
    this.statusCode = response.statusCode;
    this.result = this.convertBodyToMap(response.body);
  }
}

class HttpServiceUtils {
  Map<String, dynamic> convertBodyToMap(String responseBody) {
    if (responseBody.isNotEmpty)
      return json.decode(responseBody);
    else
      return {};
  }

  Map<String, String> makeAuthHeader(String token) {
    return {HttpHeaders.authorizationHeader: 'Bearer ' + token};
  }

  Uri httpServiceMakeUrl({required host, String? query}) {
    return Uri.parse(host + '/' + (query != null ? query : ''));
  }

  Future<http.Response> httpServiceMakeCall(
      {required Uri url,
      required HttpServiceRequestType reqType,
      Map<String, dynamic>? parameters,
      Map<String, String>? headers}) async {
    switch (reqType) {
      case HttpServiceRequestType.POST:
        return await http.post(url, body: parameters, headers: headers);
      case HttpServiceRequestType.GET:
        return await http.get(url, headers: headers);
      case HttpServiceRequestType.PATCH:
        return await http.patch(url, body: parameters, headers: headers);
    }
  }
}
