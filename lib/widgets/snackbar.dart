import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppSnackbar {
  AppSnackbar._();

  static success(
    BuildContext context, {
    required String message,
  }) {
    showTopSnackBar(
        Overlay.of(context),
        Stack(
          children: [
            const CustomSnackBar.success(
              backgroundColor: Color.fromARGB(255, 45, 128, 91),
              messagePadding: EdgeInsets.zero,
              message: "",
              textAlign: TextAlign.left,
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              // textStyle: AppTextStyle.black(12, color: Colors.white),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 15, right: 40, top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width - 150,
                        child: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                          // style: AppTextStyle.black(14, color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Container(
                          width: 46,
                          height: 45,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 10.50),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFE8FFF1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Color.fromARGB(255, 45, 128, 91),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        dismissDirection: [DismissDirection.horizontal, DismissDirection.up]);
  }

  static info(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    showTopSnackBar(
        Overlay.of(context),
        Stack(
          children: [
            const CustomSnackBar.success(
              backgroundColor: Color(0xffFCA652),
              messagePadding: EdgeInsets.zero,
              message: "",
              textAlign: TextAlign.left,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              // textStyle: AppTextStyle.black(12, color: Colors.white),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 15, right: 40, top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width - 150,
                        child: Text(
                          message,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          // style: AppTextStyle.black(14, color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Container(
                          width: 46,
                          height: 45,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 10.50),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFE8FFF1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Icon(
                            Icons.more_horiz,
                            color: Color.fromARGB(255, 45, 128, 91),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        dismissDirection: [DismissDirection.horizontal, DismissDirection.up]);
  }

  static warning(
    BuildContext context, {
    required String message,
  }) {
    showTopSnackBar(
        Overlay.of(context),
        Stack(
          children: [
            const CustomSnackBar.success(
              backgroundColor: Color(0xffFCA652),
              messagePadding: EdgeInsets.zero,
              message: "",
              textAlign: TextAlign.left,
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Warning!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        // style: AppTextStyle.blackBold(18, color: Colors.white),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Expanded(
                        child: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          // style: AppTextStyle.black(14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        dismissDirection: [DismissDirection.horizontal, DismissDirection.up]);
  }

  static error(
    BuildContext context, {
    required String message,
  }) {
    showTopSnackBar(
        Overlay.of(context),
        Stack(
          children: [
            const CustomSnackBar.success(
              backgroundColor: Color(0xffff5252),
              messagePadding: EdgeInsets.zero,
              message: "",
              textAlign: TextAlign.left,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),

              // textStyle: AppTextStyle.black(12, color: Colors.white),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 15, right: 40, top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width - 150,
                        child: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                          // style: AppTextStyle.black(14, color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Container(
                          width: 46,
                          height: 45,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 10.50),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFE8F1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Icon(
                            Icons.thumb_down_alt,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        dismissDirection: [DismissDirection.horizontal, DismissDirection.up]);
  }
}
