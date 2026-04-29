import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paxify/api/profile_api.dart';
import 'package:paxify/app_service/local_storage.dart';
import 'package:paxify/model/bank_model.dart';
import 'package:paxify/model/profile_model.dart';
import 'package:paxify/model/subscription_cat_model.dart';
import 'package:paxify/modules/setting/setting_state.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/widgets/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingLogic extends GetxController {
  SettingState state = SettingState();
  LocalStorage storage = LocalStorage();
  final api = Get.put(ProfileApi());
  TextEditingController nameController = TextEditingController();
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController nextController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController specializationController = TextEditingController();

  // TextEditingController nextKinNumberController = TextEditingController();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    state.id.value = await storage.getVarable('id') ?? '';
    state.userToken.value = await storage.getVarable('token') ?? '';
    state.storedPassword.value = await storage.getVarable('password') ?? '';
    state.enableBiometric.value =
        await storage.getBoolVarable('biometric') ?? false;
    nextController.text = 'Bolu';
    getBanks(Get.context!);
    // nextKinNumberController.text = '09089988778';
  }

  var selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  TextEditingController passwordController = TextEditingController();
  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  Future<void> getUserDetail(BuildContext context, id) async {
    state.isLoading.value = true;
    var req = await api.getProfileData(id);
    var reqBody = req.body;
    state.isLoading.value = false;
    log('${reqBody['data']}');
    if (reqBody['status'] == 200) {
      state.profileInformation.value = ProfileInfo.fromJson(reqBody['data']);
      state.allAssessment.value = List<Assessment>.from(
          reqBody['data']['assessments'].map((x) => Assessment.fromJson(x)));
      Future.delayed(const Duration(milliseconds: 500), () {
        nameController.text = state.profileInformation.value?.fullName ?? '';
        emailController.text = state.profileInformation.value?.email ?? '';
        phoneController.text =
            state.profileInformation.value?.phoneNumber ?? '';
        genderController.text = state.profileInformation.value?.gender ?? '';
        accountController.text = state.profileInformation.value?.doctorProfile
                ?.wallet?.accountNumber ??
            'Nil';
        accountNameController.text = state
                .profileInformation.value?.doctorProfile?.wallet?.accountName ??
            'Nil';
        final bankName =
            state.profileInformation.value?.doctorProfile?.wallet?.bankName;
        if (bankName != null) {
          state.selectedBank.value = BankData(name: bankName);
          bioController.text =
              state.profileInformation.value?.doctorProfile?.bio ?? '';
        }
        state.specialization.value =
            state.profileInformation.value?.doctorProfile?.specializations ??
                [];
      });
    } else {
      AppSnackbar.error(context, message: 'Request failed');
    }
  }

  Future<void> uploadUserImage(BuildContext context, File image) async {
    state.isUpLoading.value = true;
    var req = await api.uploadProfileImage(image);
    var reqBody = req.body;
    state.isUpLoading.value = false;
    if (reqBody['status'] == 200) {
      AppSnackbar.success(context, message: reqBody['message']);
      getUserDetail(context, state.id.value);
      selectedImage.value = null;
      state.showEditView.value = false;
    } else {
      state.showEditView.value = false;
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  Future<void> changePassword(
      BuildContext context, String oldPass, String newPass) async {
    state.isUpLoading.value = true;
    var req = await api.changePassword(oldPass, newPass);
    var reqBody = req.body;

    state.isUpLoading.value = false;
    if (reqBody['status'] == 200) {
      AppSnackbar.success(context, message: reqBody['message']);
      await storage.saveVariable('password', newPass);
      Get.back();
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  Future<void> updateProfile(
    BuildContext context,
  ) async {
    state.isUpLoading.value = true;
    var req = await api.updateDoctorProfile(
        fullName: nameController.text,
        phoneNumber: phoneController.text,
        gender: genderController.text,
        bankName: state.selectedBank.value?.name,
        accountNumber: accountController.text,
        bankCode: state.selectedBank.value?.code,
        accountName: accountNameController.text,
        bio: bioController.text,
        specializations: state.specialization);

    var reqBody = req.body;
    state.isUpLoading.value = false;
    if (reqBody['status'] == 200) {
      AppSnackbar.success(context, message: reqBody['message']);
      state.showEditView.value = false;
      state.selectedBank.value = null;
      accountController.clear();
      accountNameController.clear();
      getUserDetail(context, state.id.value);
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
      state.showEditView.value = false;
    }
  }

  Future<void> logOut() async {
    await storage.remove('accessToken');
    
    Future.delayed(const Duration(milliseconds: 500));
    Get.offAllNamed(Routes.SIGNINVIEW);
    Get.deleteAll(force: true);
  }

  Future<void> getSubPlan(BuildContext context) async {
    state.isLoading.value = true;
    var req = await api.getSubPlan();
    var reqBody = req.body;
    state.isLoading.value = false;
    if (reqBody['status'] == 200) {
      state.plans.value = List<SubscriptionCatModel>.from(
          reqBody['data'].map((x) => SubscriptionCatModel.fromJson(x)));
    } else {
      AppSnackbar.error(context, message: 'Request failed');
    }
  }

  Future<void> getBanks(BuildContext context) async {
    state.isLoading.value = true;
    var req = await api.getBanks();
    var reqBody = req.body;
    state.isLoading.value = false;
    if (reqBody['status'] == 200) {
      state.banks.value =
          List<BankData>.from(reqBody['data'].map((x) => BankData.fromJson(x)));
      state.searchedBank.assignAll(state.banks);
    } else {
      AppSnackbar.error(context, message: 'Request failed');
    }
  }

  void launch(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> userSub(
    BuildContext context,
    String planOptionId,
  ) async {
    state.isLoading.value = true;
    var req = await api.userSub(planOptionId);
    var reqBody = req.body;
    state.isLoading.value = false;
    if (reqBody['status'] == 200) {
      final url = reqBody['data']['data']['authorization_url'];

      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      AppSnackbar.error(context, message: 'Request failed');
    }
  }

  void searchList(String searchWord) {
    if (searchWord.isEmpty) {
      state.searchedBank.assignAll(state.banks);
    } else {
      state.searchedBank.assignAll(state.banks.where((item) =>
          item.name!.toLowerCase().contains(searchWord.toLowerCase())));
    }
    log('Updating list with: ${state.banks.map((e) => e.name).join(", ")}');
  }
}
