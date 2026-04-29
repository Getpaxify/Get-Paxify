import 'dart:developer';

import 'package:get/get.dart';

import '../widgets/keeper.dart';

class RegisterApi extends GetConnect {
  @override
  void onInit() {
    print("onInit");
    httpClient.baseUrl = base_url;

    httpClient.timeout = const Duration(minutes: 10);

    httpClient.addRequestModifier<dynamic>((request) async {
      print("mytoken ");
      // print(box.read('accessToken'));
      // // Add your custom logic here
      // // For example, adding an authorization header
      // request.headers['Authorization'] = "Bearer ${box.read('accessToken')}";
      request.headers['apikey'] = '12345678';
      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      print("response");
      print(response.body);

      // if (response.statusCode == 401) {
      //   Get.offAllNamed(Routes.LOGIN);
      // }

      return response;
    });
  }

  Future<Response> signUp(
      String fullname,
      String email,
      String phoneNumber,
      String password,
      String confirmPassword,
      String role,
      String age,
      String country,
      String timeZone) async {
    var body = {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "fullName": fullname,
      "phoneNumber": "+234$phoneNumber",
      "role": role,
      "age": int.parse(age),
      "country": country,
      "timeZone":timeZone
    };
    log('$body');
    return post('/authentication/register', body);
  }

  Future<Response> signin(
    String email,
    String password,
  ) async {
    var body = {
      "username": email,
      "password": password,
    };
    log('$body');
    return post('/authentication/login', body);
  }

  Future<Response> verifyGmail(
    String email,String otp
  ) async {
    var body = {"email": email,
    "otp":otp};
    log('$body');
    return post('/authentication/verify-email', body);
  }

  Future<Response> confirmGmail(String email, String otp) async {
    var body = {"email": email, "code": otp};
    log('$body');
    return post('/email-verification-continue', body);
  }

  Future<Response> createPin(String email, String pin) async {
    var body = {"email": email, "pin": pin};
    log(' this is on $body');
    return post('/set-pin', body);
  }


    Future<Response> getCountries() async {

    return get('/users/timezones');
  }

  Future<Response> forgotPassword(String email) async {
    var body = {"email": email};
    log(' this is on $body');
    return post('/authentication/forgot-password', body);
  }

  Future<Response> resetPassword(String password,String token) async {
    var body = {"newPassword": password, "token":token};
    log(' this is on $body');
    return post('/authentication/reset-password', body);
  }

}
