import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paxify/api/register_api.dart';
import 'package:paxify/app_service/biometrc_service.dart';
import 'package:paxify/app_service/local_storage.dart';
import 'package:paxify/model/countries_model.dart';
import 'package:paxify/modules/choose_option/choose_option_logic.dart';
import 'package:paxify/modules/choose_option/choose_option_state.dart';
import 'package:paxify/modules/signup/sign_up_state.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/widgets/snackbar.dart';

class SignUpLogic extends GetxController {
  final SignUpState state = SignUpState();
  final userNature = Get.put(ChooseOptionState());
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getCountries(Get.context!);
    state.isBiometric.value =
        await storage.getBoolVarable('biometric') ?? false;
    state.isFilledAssessment.value =
        await storage.getBoolVarable('isFilledAssessment') ?? false;
  }

  final ChooseOptionLogic optionLogic = Get.find<ChooseOptionLogic>();
  LocalStorage storage = LocalStorage();
  BiometricService biometric = Get.put(BiometricService());
  ChooseOptionState get optionState => optionLogic.state;
  final api = Get.put(RegisterApi());
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController age = TextEditingController();
  void fieldFilled() {
    if (firstName.text.isNotEmpty &&
        mobile.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        cpassword.text.isNotEmpty &&
        (state.selectedCountry.value?.name ?? '').isNotEmpty &&
        state.selectedGender.value.isNotEmpty) {
      state.isFilled.value = true;
    } else {
      state.isFilled.value = false;
    }
  }

  void isLoginFilled() {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      state.isLoginFilled.value = true;
    } else {
      state.isLoginFilled.value = false;
    }
  }

  void validate(context) {
    if (mobile.text.length < 10) {
      Get.snackbar(
          backgroundColor: appRed,
          colorText: whiteColor,
          'Error',
          'Phone number is too short');
    } else if (password.text.length < 8) {
      Get.snackbar(
          backgroundColor: appRed,
          colorText: whiteColor,
          'Error',
          'Password too short');
    } else if (password.text != cpassword.text) {
      Get.snackbar(
          backgroundColor: appRed,
          colorText: whiteColor,
          'Error',
          'Password do not match');
    } else {
      signUp(context);
    }
  }

  Future<void> signUp(BuildContext context) async {
    state.isLoading.value = true;
    var req = await api.signUp(
      firstName.text.trim(),
      email.text.trim(),
      mobile.text.trim(),
      password.text.trim(),
      cpassword.text.trim(),
      optionState.mode.value.toLowerCase(),
      age.text,
      state.selectedCountry.value?.name ?? '',
      state.selectedCountry.value?.timezones.first ?? '',
    );
    var reqBody = req.body;
    state.isLoading.value = false;
    if (reqBody['status'] == 201) {
      AppSnackbar.success(context, message: reqBody['message']);
      firstName.clear;

      password.clear;

      Get.toNamed(Routes.VERIFYEMAIL, arguments: email.text.trim());
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  Future<void> signIn(BuildContext context) async {
    state.isLoading.value = true;
    var req = await api.signin(email.text.trim(), password.text.trim());
    var reqBody = req.body;
    state.isLoading.value = false;
    if (reqBody['status'] == 200) {
      AppSnackbar.success(context, message: reqBody['message']);
      log('${state.isFilledAssessment.value}');
      reqBody['data']['role'] == 'patient'
          ? userNature.userNature.value = 1
          : userNature.userNature.value = 2;
      Future.delayed(Duration(milliseconds: 300), () {
        if (reqBody['data']['role'] == 'patient') {
          state.isFilledAssessment.value
              ? Get.toNamed(Routes.BOTTOMNAV)
              : Get.toNamed(Routes.ASSESSMENT);
          print('${userNature.userNature.value}');
        } else {
          Get.toNamed(Routes.BOTTOMNAV);
          print('${userNature.userNature.value}');
        }
      });

      await storage.saveVariable('email', reqBody['data']['email']);
      await storage.saveVariable('token', reqBody['data']['accessToken']);
      await storage.saveVariable('id', reqBody['data']['id']);
      await storage.saveVariable('password', password.text.trim());
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  Future<void> loginWithBiometric(BuildContext context) async {
    final email = await storage.getVarable('email');
    final pass = await storage.getVarable('password');
    final isAuthenticated = await biometric.authenticate(context);

    if (isAuthenticated) {
      state.isLoading.value = true;
      if (email!.isEmpty || pass!.isEmpty) {
        AppSnackbar.error(context,
            message: 'Kindly login with button to be able to use this service');
      } else {
        var req = await api.signin(email ?? '', pass ?? "");
        var reqBody = req.body;
        state.isLoading.value = false;
        if (reqBody['status'] == 200) {
          AppSnackbar.success(context, message: reqBody['message']);

          reqBody['data']['role'] == 'patient'
              ? userNature.userNature.value = 1
              : userNature.userNature.value = 2;
          // if (reqBody['data']['role'] == 'patient') {
          //   Get.toNamed(Routes.BOTTOMNAV);
          // } else {}

          reqBody['data']['role'] != 'patient' || state.isFilledAssessment.value
              ? Get.toNamed(Routes.BOTTOMNAV)
              : Get.toNamed(Routes.ASSESSMENT);
        } else {
          AppSnackbar.error(context, message: reqBody['message']);
        }
      }
    }
  }

  Future<void> getCountries(BuildContext context) async {
    state.isLoading.value = true;
    final req = await api.getCountries();
    state.isLoading.value = false;
    final reqBody = req.body;
    if (reqBody['status'] == 200) {
      state.countries.value = List<CountryData>.from(
          reqBody['data'].map((x) => CountryData.fromJson(x)));
      state.searchedCountry.assignAll(state.countries);
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  void searchList(String searchWord) {
    if (searchWord.isEmpty) {
      state.searchedCountry.assignAll(state.countries);
    } else {
      state.searchedCountry.assignAll(state.countries.where((item) =>
          item.name.toLowerCase().contains(searchWord.toLowerCase())));
    }
    log('Updating list with: ${state.countries.map((e) => e.name).join(", ")}');
  }
}
