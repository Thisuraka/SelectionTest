import 'api_caller.dart';
import 'api_response.dart';

class ApiCalls {
  static Future<ApiResponse> geoLocation() async {
    try {
      return ApiCaller.getLocationRequest("http://ip-api.com/json");
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> taskTwoGet() async {
    try {
      return ApiCaller.getLocationRequest(
          "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/index.json");
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }
}
