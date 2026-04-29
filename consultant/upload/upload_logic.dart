import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paxify/api/profile_api.dart';
import 'package:paxify/modules/consultant/upload/upload_state.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/widgets/snackbar.dart';

class UploadLogic extends GetxController {
  UploadState state = UploadState();
  TextEditingController bioController = TextEditingController();
  TextEditingController specializationController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  final api = Get.put(ProfileApi());
  Future<void> pickImage(ImageSource source, Rx<File?> target) async {
    final XFile? file = await _picker.pickImage(source: source);

    if (file != null) {
      target.value = File(file.path);
      if (state.imagesSelected.contains(File(file.path))) {
      } else {
        state.imagesSelected.add(File(file.path));
      }
    }
  }

  Future<void> updateProfile(
    BuildContext context,
  ) async {
    state.isUpLoading.value = true;
    var req = await api.updateDoctorProfile(
        bio: bioController.text, specializations: state.specialization);

    var reqBody = req.body;
    state.isUpLoading.value = false;
    if (reqBody['status'] == 200) {
      AppSnackbar.success(context, message: reqBody['message']);
      Get.toNamed(Routes.SIGNINVIEW);
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }

  Future<void> uploadProviderId(BuildContext context, String routes) async {
    state.isUpLoading.value = true;
    var req = await api.uploadProviderId(
        licence: state.selectedLicense.value,
        identification: state.selectedId.value);
    var reqBody = req.body;
    state.isUpLoading.value = false;
    if (reqBody['status'] == 200) {
      AppSnackbar.success(context, message: reqBody['message']);
      routes.isEmpty ? Get.toNamed(Routes.SPECIALIZATION) : Get.back();
      state.selectedId.value = null;
      state.selectedLicense.value = null;
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }
}
