import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkClient {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      logRequest(url);
      Response response = await get(uri);
      logResponse(url, response);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -10,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
    String url,
    Map<String, dynamic>? body,
  ) async {
    try {
      Uri uri = Uri.parse(url);
      logRequest(url, body: body);
      Response response = await post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      logResponse(url, response);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -10,
        errorMessage: e.toString(),
      );
    }
  }

  void logRequest(String url, {Map<String, dynamic>? body}) {
    debugPrint(
      "url: $url\n"
      "body: $body",
    );
  }

  void logResponse(String url, Response response) {
    debugPrint(
      "response: $response\n"
      "body response: ${response.body}\n"
      "status code: ${response.statusCode}",
    );
  }
}

class NetworkResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic body;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.responseCode,
    this.body,
    this.errorMessage,
  });
}
