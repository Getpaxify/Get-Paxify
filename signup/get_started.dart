// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:planetf/modules/signup/sign_up_logic.dart';
// import 'package:planetf/routes/app_pages.dart';
// import 'package:planetf/theme/app_colors.dart';
// import 'package:planetf/utils/extension/widget_extensions.dart';
// import 'package:planetf/widgets/app_bar.dart';
// import 'package:planetf/widgets/auth_text_field.dart';
// import 'package:planetf/widgets/custom_text.dart';
// import 'package:planetf/widgets/load.dart';

// class GetStarted extends StatelessWidget {
//   GetStarted({super.key});
//   final logic = Get.find<SignUpLogic>();
//   final state = Get.find<SignUpLogic>().state;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF7F7F7),
//       appBar: const CustomAppBar(
//         title: '',
//         circleColor: transparent,
//         iconColor: transparent,
//         backgroundColor: transparent,
//       ),
//       body: Obx(() => Padding(
//             padding: const EdgeInsets.only(right: 20.0, left: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Image.asset(
//                       'images/logo.png',
//                       height: 49.h,
//                       width: 49.h,
//                     ),
//                   ],
//                 ),
//                 50.0.h.spacingH,
//                 CustomText(
//                   text: 'Let’s get Started!',
//                   fontSize: 24.sp,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: 'Poppins',
//                 ),
//                 CustomText(
//                   text: 'Start your PlanetF journey',
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 94.0.h.spacingH,
//                 Container(
//                   padding: EdgeInsets.all(8.sp),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.r),
//                       color: primaryColor),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'images/gmail.png',
//                         height: 22.h,
//                         width: 22.w,
//                       ),
//                       10.0.w.spacingW,
//                       CustomText(
//                         text: 'Continue with Google',
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w400,
//                         textColor: whiteColor,
//                       ),
//                     ],
//                   ),
//                 ),
//                 5.0.h.spacingH,
//                 Container(
//                   padding: EdgeInsets.all(8.sp),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.r),
//                       color: primaryColor),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'images/Apple.png',
//                         height: 22.h,
//                         width: 22.w,
//                       ),
//                       10.0.w.spacingW,
//                       CustomText(
//                         text: 'Continue with Apple-ID',
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w400,
//                         textColor: whiteColor,
//                       ),
//                     ],
//                   ),
//                 ),
//                 5.0.h.spacingH,
//                 InkWell(
//                   onTap: () {
//                     Get.toNamed(Routes.SIGNUPVIEW);
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(8.sp),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.r),
//                         boxShadow: [
//                           BoxShadow(
//                               offset: const Offset(0, 0),
//                               color: Colors.grey.withOpacity(0.6))
//                         ],
//                         color: whiteColor),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CustomText(
//                           text: 'Continue with Email',
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w400,
//                           textColor: blackColor,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 30.0.h.spacingH,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Checkbox(
//                         visualDensity: const VisualDensity(
//                             horizontal: VisualDensity.minimumDensity),
//                         value: state.groupValue.value,
//                         onChanged: (val) {
//                           state.groupValue.value = val!;
//                         }),
//                     RichText(
//                       textAlign: TextAlign.start,
//                       text: TextSpan(
//                         text: 'I confirm ',
//                         style: TextStyle(
//                           color: blackColor,
//                           fontFamily: 'Manrope',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 13.sp,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Center(
//                   child: SizedBox(
//                     width: 290.w,
//                     child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         text: 'By proceeding you agree to PlanetF ',
//                         style: TextStyle(
//                           color: blackColor,
//                           fontFamily: 'Manrope',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 13.sp,
//                         ),
//                         children: [
//                           TextSpan(
//                             text: 'Terms & Condition',
//                             style: TextStyle(
//                               color: primaryColor,
//                               fontFamily: 'Manrope',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                             ),
//                           ),
//                           TextSpan(
//                             text: ' and ',
//                             style: TextStyle(
//                               color: blackColor,
//                               fontFamily: 'Manrope',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                             ),
//                           ),
//                           TextSpan(
//                             text: ' Privacy Policy',
//                             style: TextStyle(
//                               color: primaryColor,
//                               fontFamily: 'Manrope',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 5.0.h.spacingH,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     RichText(
//                       textAlign: TextAlign.start,
//                       text: TextSpan(
//                         text: 'Already have an account?',
//                         style: TextStyle(
//                           color: blackColor,
//                           fontFamily: 'Manrope',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 13.sp,
//                         ),
//                         children: [
//                           TextSpan(
//                             text: '  Login Here',
//                             style: TextStyle(
//                               color: primaryColor,
//                               fontFamily: 'Manrope',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                             ),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 Get.toNamed(Routes.LOGINVIEW);
//                               },
//                           ),
//                         ],
//                       ),
//                     ),
//                     5.0.h.spacingH,
//                   ],
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }
