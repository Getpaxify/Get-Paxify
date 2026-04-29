import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paxify/modules/home_therapy/home_state.dart';
import 'package:paxify/utils/extension/widget_extensions.dart';
import 'package:paxify/widgets/custom_text.dart';

class Article extends StatelessWidget {
  const Article({super.key});

  @override
  Widget build(BuildContext context) {
    ArticleModel article = Get.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
                borderRadius:
                    BorderRadiusGeometry.vertical(bottom: Radius.circular(10.r)),
                child: Image.asset(
                  article.image,
                  height: MediaQuery.of(context).size.height * .45,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
                10.0.h.spacingH,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Column(
                children: [
                  HeaderText(
                    text: article.title,
                  ),
                  20.0.h.spacingH,
                  CustomText(
                    text: article.body,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
