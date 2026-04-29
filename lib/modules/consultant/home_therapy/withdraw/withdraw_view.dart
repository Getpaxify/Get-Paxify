import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/consultant/home_therapy/home_logic.dart';
import 'package:paxify/modules/setting/setting_logic.dart';
import 'package:paxify/modules/signup/sign_up_view.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/auth_text_field.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';
import 'package:paxify/widgets/snackbar.dart';

class WithdrawConView extends StatelessWidget {
  WithdrawConView({super.key});
  final logic = Get.find<ConsultantHomeLogic>();
  final state = Get.find<ConsultantHomeLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(14.sp),
                    decoration: BoxDecoration(
                        color: Color(0xffF0F0F0),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Icon(Icons.chevron_left),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .14,
                  ),
                  HeaderText(
                    text: 'Withdrawal',
                  ),
                ],
              ),
              24.0.h.spacingH,
              AuthTextField(
                fieldLabel: 'Amount',
                suffixIcon: Icon(Icons.cancel_outlined),
                controller: logic.amountController,
                onChange: (p0) {
                  logic.fieldFilled();
                },
                obscure: false,
              ),
              16.0.h.spacingH,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        text:
                            'Balance: #${logic.settinState.profileInformation.value?.wallet?.balance.toString() ?? '0.00'}',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      8.0.h.spacingH,
                      CustomText(
                        text:
                            'Withdrawable Balance: #${logic.settinState.profileInformation.value?.wallet?.balance.toString() ?? '0.00'}',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
              50.0.h.spacingH,
              LoadButton(
                label: 'Withdraw',
                function: !state.isFilled.value
                    ? () {
                        AppSnackbar.error(context,
                            message: 'Amount is required');
                      }
                    : () {
                        if (double.parse(logic.amountController.text) >
                            (logic.settinState.profileInformation.value?.wallet
                                    ?.balance ??
                                0)) {
                                  AppSnackbar.error(context,
                            message: 'Insufficient account balance');
                                } else{
                                  logic.withdrawFunds(
                            context, logic.amountController.text);
                                }
                        
                      },
                color: !state.isFilled.value
                    ? primaryColor.withOpacity(0.6)
                    : primaryColor,
              ),
              16.0.h.spacingH,
              CustomText(
                text: 'Minimum per transaction is NGN 1.00',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              8.0.h.spacingH,
              CustomText(
                text: 'Maximum per transaction is NGN 9,999,999.00',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
                ],
              )),
        ),
      )),
    );
  }
}

class BankSheet extends StatelessWidget {
  BankSheet({
    super.key,
  });

  final state = Get.find<SettingLogic>().state;

  final logic = Get.find<SettingLogic>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
              children: [
                SizedBox(
                  width: 40.w,
                  height: 2,
                  child: Divider(
                    color: greyText,
                  ),
                ),
                16.0.h.spacingH,
                HeaderText(
                  text: 'Select Bank',
                ),
                14.0.h.spacingH,
                AuthTextField(
                  suffixIcon: Icon(Icons.search),
                  fieldLabel: '',
                  hintTextStyle:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  hintText: 'Search Bank',
                  onChange: (val) {
                    logic.searchList(val);
                  },
                ),
                14.0.h.spacingH,
                Expanded(
                  child: ListView.builder(
                      itemCount: state.searchedBank.length,
                      itemBuilder: (context, index) {
                        final bank = state.searchedBank[index];
                        return InkWell(
                          onTap: () {
                            state.selectedBank.value = bank;
                            Get.back();
                          },
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 2.h),
                                leading: Icon(Icons.account_balance),
                                title: CustomText(
                                  text: bank.name,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        );
                      }),
                )
              ],
            )),
      ),
    );
  }
}
