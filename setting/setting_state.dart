import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paxify/model/bank_model.dart';
import 'package:paxify/model/profile_model.dart';
import 'package:paxify/model/subscription_cat_model.dart';

class SettingState {
  SettingState();
  RxBool showEditView = false.obs;
  RxBool enableBiometric = false.obs;
  RxBool isVisibility = false.obs;
  RxBool isCurrentVisibility = false.obs;
  RxBool isNewVisibility = false.obs;
  RxBool isConfVisibility = false.obs;
  RxBool isLoading = false.obs;
  RxBool isUpLoading = false.obs;
  RxBool isEditting = false.obs;
  RxString fullName = ''.obs;
  RxString email = ''.obs;
  RxString role = ''.obs;
  RxString phone = ''.obs;
  RxString id = ''.obs;
  Rxn<BankData?> selectedBank = Rxn(null);
  RxString storedPassword = ''.obs;
  RxString userToken = ''.obs;
  Rxn<ProfileInfo?> profileInformation = Rxn(null);
   RxList<String> specialization = RxList<String>.from([]);
  RxList<Assessment> allAssessment = RxList<Assessment>.from([]);
  RxList<SubscriptionCatModel> plans = RxList<SubscriptionCatModel>.from([]);
  RxInt age = 0.obs;
  final formKey = GlobalKey<FormState>();
  RxList<BankData> banks =
      RxList<BankData>.from([]);
        RxList<BankData> searchedBank =
      RxList<BankData>.from([]);
}
