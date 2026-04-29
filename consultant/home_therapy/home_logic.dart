import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:paxify/api/profile_api.dart';
import 'package:paxify/app_service/local_storage.dart';
import 'package:paxify/modules/consultant/home_therapy/home_state.dart';
import 'package:paxify/modules/setting/setting_logic.dart';
import 'package:paxify/modules/setting/setting_state.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/widgets/snackbar.dart';

class ConsultantHomeLogic extends GetxController {
  final ConsultantHomeState state = ConsultantHomeState();
  final ScrollController scrollController = ScrollController();
  TextEditingController amountController = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    settingLogic.getUserDetail(Get.context!, state.id.value);
    settingLogic.getSubPlan(Get.context!);
    scrollController.addListener(_onScroll);
  }

  void fieldFilled() {
    if (amountController.text.isNotEmpty) {
      state.isFilled.value = true;
    } else {
            state.isFilled.value = false;
    }
  }

  void _onScroll() {
    if (scrollController.offset > 150.h && !state.isAppBarCollapsed.value) {
      // AppBar is fully collapsed, change status bar to dark

      state.isAppBarCollapsed.value = true;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else if (scrollController.offset <= 150.h &&
        state.isAppBarCollapsed.value) {
      // AppBar is visible, change status bar to light

      state.isAppBarCollapsed.value = false;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  final SettingLogic settingLogic = Get.find<SettingLogic>();

  SettingState get settinState => settingLogic.state;
  LocalStorage storage = LocalStorage();

  final api = Get.put(ProfileApi());

  void showAddBankDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.account_balance, size: 48, color: primaryColor),
              const SizedBox(height: 12),
              const Text(
                'Bank Details Required',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                'To withdraw funds, please add your bank details in your profile.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: blackColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.toNamed(Routes.EDITPROFILE);
                      },
                      child: const Text(
                        'Go to Profile',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: blackColor),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  Future<void> withdrawFunds(BuildContext context, String amount) async {
    state.isLoading.value = true;
    var req = await api.withdraw(amount);
    var reqBody = req.body;
    state.isLoading.value = false;
    if (reqBody['status'] == 200) {
      AppSnackbar.success(context, message: reqBody['message']);
    } else {
      AppSnackbar.error(context, message: reqBody['message']);
    }
  }
}
