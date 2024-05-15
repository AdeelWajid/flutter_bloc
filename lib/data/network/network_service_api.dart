import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_blocs/data/exceptions/app_exceiptions.dart';
import 'package:flutter_blocs/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkServiceApi extends BaseApiService {
  @override
  Future<dynamic> get(String url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    dynamic jsonResponse;
    try {
      final response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException("Time out try again");
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> post(String url, data,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) async {
    dynamic jsonResponse;
    try {
      final response =
      await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 30));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException("Time out try again");
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> put(String url, data,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body}) async {
    dynamic jsonResponse;
    try {
      final response =
      await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 30));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException("Time out try again");
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic res = jsonDecode(response.body);
        return res;
      case 400:
        dynamic res = jsonDecode(response.body);
        throw FetchDataException(res['message']);
      case 401:
      case 403:
        throw UnAuthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
