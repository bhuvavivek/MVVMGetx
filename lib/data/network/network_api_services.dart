import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mvvmwithget/data/app_exception.dart';
import 'package:mvvmwithget/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiService {
  @override
  Future get(String url) async {
    // if (kDebugMode) {
    //   print(url);
    // }
    try {
      final response = await http.get(Uri.parse(url));
      return _handleResponse(response);
    } on http.ClientException {
      throw InternetException('No Internet');
    } on FormatException {
      throw RunTimeException('RunTimeException');
    } on SocketException {
      throw InternetException("No Internet");
    } catch (e) {
      throw RunTimeException(e.toString());
    }
  }

  @override
  Future delete(String url) async {
    if (kDebugMode) {
      print(url);
    }
    try {
      final response = await http.delete(Uri.parse(url));
      return _handleResponse(response);
    } on http.ClientException {
      throw InternetException('No Internet');
    } on FormatException {
      throw RunTimeException('RunTimeException');
    } on SocketException {
      throw InternetException("No Internet");
    } catch (e) {
      throw RunTimeException(e.toString());
    }
  }

  @override
  Future post(String url, data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json"});
      return _handleResponse(response);
    } on http.ClientException {
      throw InternetException('No Internet');
    } on FormatException {
      throw RunTimeException('RunTimeException');
    } on SocketException {
      throw InternetException("No Internet");
    } catch (e) {
      throw RunTimeException(e.toString());
    }
  }

  @override
  Future put(String url, data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    try {
      final response = await http.put(Uri.parse(url), body: jsonEncode(data));
      return _handleResponse(response);
    } on http.ClientException {
      throw InternetException('No Internet');
    } on FormatException {
      throw RunTimeException('RunTimeException');
    } on SocketException {
      throw InternetException("No Internet");
    } catch (e) {
      throw RunTimeException(e.toString());
    }
  }

  dynamic _handleResponse(http.Response response) {
    var jsonresponse = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        // if (kDebugMode) {
        //   print(jsonresponse);
        // }
        return jsonresponse;
      case 400:
        throw BadRequestException(jsonresponse.toString());
      case 401:
        throw UnauthorizedException(jsonresponse.toString());
      case 404:
        throw NotFoundException(jsonresponse.toString());
      case 500:
        throw ServerException(jsonresponse.toString());
      default:
        throw UnknownErorrException(
            "Unknown error occurred with status code: ${response.statusCode}");
    }
  }
}
