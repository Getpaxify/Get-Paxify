import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/choose_option/choose_option_state.dart';
import 'package:paxify/routes/app_pages.dart';
import 'package:paxify/theme/app_colors.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';
import 'package:paxify/widgets/load.dart';

class StartTherapy extends StatelessWidget {
  StartTherapy({super.key});
  final userNature = Get.put(ChooseOptionState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(),
            Image.asset(
              'images/therapy.png',
              height: 357.h,
            ),
            30.0.h.spacingH,
            const SizedBox(
              width: 274,
              child: CustomText(
                text: 'You have not scheduled a therapy session yet.',
                textColor: fieldGrey,
                textAlign: TextAlign.center,
              ),
            ),
            40.0.h.spacingH,
            LoadButton(
                label: 'Begin Therapy',
                function: () {
                  Get.toNamed(Routes.BOTTOMNAV);
                  userNature.userNature.value = 1;
                })
          ],
        ),
      ),
    );
  }
}
