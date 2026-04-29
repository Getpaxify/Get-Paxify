import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadState {
  UploadState();
  List<UploadOption> option = [
    UploadOption(image: Icons.camera_alt_outlined, label: 'Scan'),
    UploadOption(image: Icons.insert_drive_file_outlined, label: 'Upload'),
  ];
  RxList<File> imagesSelected = RxList<File>();
  Rx<File?> selectedId = Rx<File?>(null);
  Rx<File?> selectedLicense = Rx<File?>(null);
  RxBool isUpLoading = false.obs;
     RxList<String> specialization = RxList<String>.from([]);
}

class UploadOption {
  final IconData image;
  final String label;
  UploadOption({required this.image, required this.label});
}
