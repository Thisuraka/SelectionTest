import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'api_response.dart';
import 'api_status.dart';

const baseLocationUrl = "http://ip-api.com/json";
const timeout = 80;

class ApiCaller {
  static Future<ApiResponse> getLocationRequest(
      {Map<String, String>? headers}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        Map<String, String> allHeaders = new Map();

        if (headers != null && headers.length > 0) {
          allHeaders.addAll(headers);
        }
        print("Url: " + baseLocationUrl);
        final response = await http
            .get(Uri.parse(baseLocationUrl), headers: headers)
            .timeout(const Duration(seconds: timeout));
        print(response.statusCode.toString() + "  Response: " + response.body);

        return ApiResponse(response: response, validateToken: false);
      } else {
        ApiResponse response = ApiResponse();
        response.isSuccess = false;
        response.apiStatus = ApiStatus.NO_INTERNET;
        response.statusMessage = "Internet connection not available";
        return response;
      }
    } catch (e) {
      ApiResponse response = ApiResponse();
      if (e is TimeoutException) {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.TIMEOUT;
        response.statusMessage = e.toString();
      } else {
        response.isSuccess = false;
        response.apiStatus = ApiStatus.EXCEPTION;
        response.statusMessage = e.toString();
      }
      return response;
    }
  }
}
