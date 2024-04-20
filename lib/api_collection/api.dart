import 'package:counselling_task/models/api_response.dart';
import 'package:counselling_task/models/terms_of_service/terms_of_service.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  static const String baseurl = "https://studylancer.yuktidea.com/api/";

  static Future<ApiResponse> getTerms() async {
    final response = await http.get(Uri.parse("$baseurl/api/terms-conditions"));
    if (response.statusCode == 200) {
      TermsOfService data = TermsOfService.fromJson(response.body);
      return ApiResponse(data: data, success: true);
    } else {
      return ApiResponse(success: false);
    }
  }
}
