import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_caller.dart';
import 'api_response.dart';

class ApiCalls {
  static Future<ApiResponse> geoLocation() async {
    try {
      return ApiCaller.getLocationRequest();
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }
}
