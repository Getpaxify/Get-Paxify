import 'dart:developer';
import 'package:get/get.dart';
import 'package:paxify/app_service/local_storage.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/widgets/keeper.dart';

class AssessmentApi extends GetConnect {
  LocalStorage storage = LocalStorage();

  @override
  void onInit() async {
    log("onInit");
    httpClient.baseUrl = base_url;

    httpClient.timeout = const Duration(minutes: 2);

    httpClient.addRequestModifier<dynamic>((request) async {
      log("mytoken ");
      final token = await storage.getVarable('token');

      log('this is the token $token');
      // // Add your custom logic here
      // // For example, adding an authorization header
      request.headers['Authorization'] = "Bearer $token";
      // request.headers['apikey'] = '12345678';
      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      print("response");
      print(response.body);

      if (response.statusCode == 401) {
        Get.offAllNamed(Routes.SIGNINVIEW);
      }

      return response;
    });
  }

  Future<Response> getAssessment() async {
    return get('/users-assessment/assessment-category');
  }

  Future<Response> createAssessment(List<String> categoryId, String intensity,
      String note, List<Map<String, String>> cause) async {
    final body = {
      "categoryIds": categoryId,
      "intensity": intensity,
      "notes": note,
      "addictionDetails": cause
    };
    log('$body');
    return post('/users-assessment/assessment', body);
  }
}
