import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:paxify/app_service/local_storage.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/widgets/keeper.dart';

class ProfileApi extends GetConnect {
  LocalStorage storage = LocalStorage();

  @override
  void onInit() async {
    print("onInit");
    httpClient.baseUrl = base_url;

    httpClient.timeout = const Duration(minutes: 2);

    httpClient.addRequestModifier<dynamic>((request) async {
      print("mytoken ");
      final token = await storage.getVarable('token');

      print('this is the token $token');
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

  Future<Response> getProfileData(String id) async {
    return get('/users/me');
  }

  Future<Response> getSubPlan() async {
    return get('/subscription/categories');
  }

  Future<Response> getBanks() async {
    return get('/subscription/nigeria');
  }

  Future<Response> getDoctor() async {
    return get('/users/expert?specializations=');
  }

  Future<Response> getUpcomingAppointment() async {
    return get('/bookings/users-bookings');
  }

  Future<Response> uploadProfileImage(File imageFile) async {
    final form = FormData({
      'file': MultipartFile(
        imageFile,
        filename: imageFile.path.split('/').last,
        contentType: 'image/jpeg', // or 'image/png'
      ),
    });

    return post('/users/profile-image', form);
  }

  // Future<Response> uploadProviderId(String idType, File imageFile) async {
  //   final form = FormData({
  //     'file': MultipartFile(
  //       imageFile,
  //       filename: imageFile.path.split('/').last,
  //       contentType: 'image/jpeg', // or 'image/png'
  //     ),
  //   });

  //   return
  //post('/users/upload-document?type=$idType', form);
  // }
  Future<Response> uploadProviderId({
    File? licence,
    File? identification,
  }) async {
    final form = FormData({});

    if (licence != null) {
      form.files.add(
        MapEntry(
          'licence',
          MultipartFile(
            licence,
            filename: licence.path.split('/').last,
            contentType: 'image/jpeg',
          ),
        ),
      );
    }

    if (identification != null) {
      form.files.add(
        MapEntry(
          'identification',
          MultipartFile(
            identification,
            filename: identification.path.split('/').last,
            contentType: 'image/jpeg',
          ),
        ),
      );
    }

    return post('/users/upload-documents', form);
  }

  Future<Response> bookDoctor(
    String doctorId,
    String scheduledAt,
  ) async {
    var body = {
      "doctorId": doctorId,
      "scheduledAt": scheduledAt,
      "durationMinutes": 59,
    };
    log('$body');
    return post('/bookings', body);
  }

Future<Response> withdraw(
    String amount,
    
  ) async {
    var body = {
      "amount": amount,

    };
    log('$body');
    return post('/subscription/withdraw', body);
  }


  Future<Response> updateDoctorProfile({
    String? fullName,
    String? phoneNumber,
    String? country,
    String? timeZone,
    String? gender,
    String? licence,
    String? identification,
    List<String>? specializations,
    String? bankName,
    String? bankCode,
    String? accountNumber,
    String? accountName,
    String? planOption,
    String? hmo,
    String? organisation,
    String? enroleeId,
    String? bio,
  }) async {
    var body = {
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "country": country,
      "timeZone": timeZone,
      "gender": gender,
      "licence": licence,
      "identification": identification,
      "specializations": specializations,
      "bankName": bankName,
      "bankCode": bankCode,
      "accountNumber": accountNumber,
      "accountName": accountName,
      "plan_option": planOption,
      "hmo": hmo,
      "organisation": organisation,
      "enroleeId": enroleeId,
      "bio": bio,
    }
     ..removeWhere((key, value) => value == null); // removes nulls

    log('$body');
    return put('/users/profile', body);
  }

  Future<Response> userSub(
    String planOptionId,
  ) async {
    var body = {
      "planOptionId": planOptionId,
    };
    log('$body');
    return post('/subscription/checkout', body);
  }

  Future<Response> changePassword(
    String oldPassword,
    String newPassword,
  ) async {
    var body = {"oldPassword": oldPassword, "newPassword": newPassword};
    log('$body');
    return put('/authentication/change-password', body);
  }
}
