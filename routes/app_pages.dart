import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:paxify/modules/appointment/appointment.dart';
import 'package:paxify/modules/appointment/appointment_binding.dart';
import 'package:paxify/modules/appointment/chat/chart.dart';
import 'package:paxify/modules/appointment/chat/chat_binding.dart';
import 'package:paxify/modules/assessment/achieve_binding.dart';
import 'package:paxify/modules/assessment/achieve_view.dart';
import 'package:paxify/modules/assessment/addiction.dart';
import 'package:paxify/modules/assessment/addiction_binding.dart';
import 'package:paxify/modules/assessment/assessment.dart';
import 'package:paxify/modules/assessment/assesstment_binding.dart';
import 'package:paxify/modules/assessment/start_therapy.dart';
import 'package:paxify/modules/assessment/start_therapy_binding.dart';
import 'package:paxify/modules/bottom_nav/bottom_nav_binding.dart';
import 'package:paxify/modules/bottom_nav/bottom_nav_view.dart';
import 'package:paxify/modules/appointment/call/call.dart';
import 'package:paxify/modules/appointment/call/call_binding.dart';
import 'package:paxify/modules/choose_option/choose_occupation.dart';
import 'package:paxify/modules/choose_option/choose_occupation_bindings.dart';
import 'package:paxify/modules/choose_option/choose_option.dart';
import 'package:paxify/modules/choose_option/choose_option_binding.dart';
import 'package:paxify/modules/choose_option/choose_plan.dart';
import 'package:paxify/modules/choose_option/choose_plan_bindings.dart';
import 'package:paxify/modules/choose_option/hmo_plan.dart';
import 'package:paxify/modules/choose_option/hmo_plan_binding.dart';
import 'package:paxify/modules/consultant/home_therapy/home_binding.dart';
import 'package:paxify/modules/consultant/home_therapy/home_view.dart';
import 'package:paxify/modules/consultant/home_therapy/withdraw/withdraw_binding.dart';
import 'package:paxify/modules/consultant/home_therapy/withdraw/withdraw_view.dart';
import 'package:paxify/modules/consultant/specialization/specialization.dart';
import 'package:paxify/modules/consultant/specialization/specialization_binding.dart';
import 'package:paxify/modules/consultant/upload/upload.dart';
import 'package:paxify/modules/consultant/upload/upload_binding.dart';
import 'package:paxify/modules/forgot_password/forgot_password_binding.dart';
import 'package:paxify/modules/forgot_password/forgot_password_view.dart';
import 'package:paxify/modules/forgot_password/reset_password.dart';
import 'package:paxify/modules/forgot_password/reset_password_binding.dart';
import 'package:paxify/modules/home_therapy/all_therapy.dart';
import 'package:paxify/modules/home_therapy/all_therapy_binding.dart';
import 'package:paxify/modules/home_therapy/article.dart';
import 'package:paxify/modules/home_therapy/article_binding.dart';
import 'package:paxify/modules/home_therapy/available_plan.dart';
import 'package:paxify/modules/home_therapy/available_plan_binding.dart';
import 'package:paxify/modules/home_therapy/know_therapist.dart';
import 'package:paxify/modules/home_therapy/know_therapist_binding.dart';
import 'package:paxify/modules/home_therapy/plan.dart';
import 'package:paxify/modules/home_therapy/plan_binding.dart';
import 'package:paxify/modules/home_therapy/therapist.dart';
import 'package:paxify/modules/home_therapy/therapist_binding.dart';
import 'package:paxify/modules/notification/notification.dart';
import 'package:paxify/modules/notification/notification_binding.dart';
import 'package:paxify/modules/onboarding/onboarding_binding.dart';
import 'package:paxify/modules/onboarding/onboarding_vew.dart';
import 'package:paxify/modules/setting/change_password.dart';
import 'package:paxify/modules/setting/change_password_binding.dart';
import 'package:paxify/modules/setting/change_profile_setting.dart';
import 'package:paxify/modules/setting/change_profile_settings_binding.dart';
import 'package:paxify/modules/setting/edit_profile.dart';
import 'package:paxify/modules/setting/edit_profile_binding.dart';
import 'package:paxify/modules/setting/help_center.dart';
import 'package:paxify/modules/setting/help_center_binding.dart';
import 'package:paxify/modules/setting/profile_setting.dart';
import 'package:paxify/modules/setting/profile_setting_binding.dart';
import 'package:paxify/modules/signup/sign_up_binding.dart';
import 'package:paxify/modules/signup/sign_up_view.dart';
import 'package:paxify/modules/signup/signin.dart';
import 'package:paxify/modules/signup/signin_binding.dart';
import 'package:paxify/modules/splash_view/splash_binding.dart';
import 'package:paxify/modules/splash_view/splash_view.dart';
import 'package:paxify/modules/verify_email/verify_email_binding.dart';
import 'package:paxify/modules/verify_email/verify_email_view.dart';

part 'app_routes.dart';

/// GetX Generator - fb.com/htngu.99
///

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASHSCREEN,
      page: () => const Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.CHOOSEOPTION,
      page: () => ChooseOption(),
      binding: ChooseOptionBinding(),
    ),
    GetPage(
      name: Routes.SIGNUPVIEW,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
        GetPage(
      name: Routes.SIGNINVIEW,
      page: () => SignInView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: Routes.OCCUPATION,
      page: () => ChooseOccupation(),
      binding: ChooseOccupationBinding(),
    ),
    GetPage(
      name: Routes.PLANVIEW,
      page: () => ChoosePlan(),
      binding: ChoosePlanBinding(),
    ),
    GetPage(
      name: Routes.HMO,
      page: () => HmoPlan(),
      binding: HmoPlanBinding(),
    ),
        GetPage(
      name: Routes.ASSESSMENT,
      page: () => Assessment(),
      binding: AssesstmentBinding(),
    ),
     GetPage(
      name: Routes.ACHIEVEMENT,
      page: () => AchieveView(),
      binding: AchieveBinding(),
    ),
    GetPage(
      name: Routes.ADDICTION,
      page: () => Addiction(),
      binding: AddictionBinding(),
    ),
        GetPage(
      name: Routes.STARTTHERAPY,
      page: () => StartTherapy(),
      binding: StartTherapyBinding(),
    ),
    GetPage(
      name: Routes.APPOINTMENT,
      page: () => Appointment(),
      binding: AppointmentBinding(),
    ),
        GetPage(
      name: Routes.BOTTOMNAV,
      page: () => BottomNavView(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: Routes.ALLTHERAPY,
      page: () => AllTherapy(),
      binding: AllTherapyBinding(),
    ),
    GetPage(
      name: Routes.KNOWNTHERAPIST,
      page: () => const KnowTherapist(),
      binding: KnowTherapistBinding(),
    ),
        GetPage(
      name: Routes.THERAPIST,
      page: () => Therapist(),
      binding: TherapistBinding(),
    ),
    GetPage(
      name: Routes.AVAILABLEPLAN,
      page: () => AvailablePlan(),
      binding: AvailablePlanBinding(),
    ),
    GetPage(
      name: Routes.PLAN,
      page: () => Plan(),
      binding: PlanBinding(),
    ),
    GetPage(
      name: Routes.PROFILESETTING,
      page: () => ProfileSetting(),
      binding: ProfileBinding(),
    ),
     GetPage(
      name: Routes.CHANGEPASSWORD,
      page: () => ChangePassword(),
      binding: ChangePasswordBinding(),
    ),
         GetPage(
      name: Routes.HELPCENTER,
      page: () => const HelpCenter(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: Routes.EDITPROFILE,
      page: () => EditProfile(),
      binding: EditProfileBinding(),
    ),
     GetPage(
      name: Routes.CHANGEPROFILESETTING,
      page: () => ChangeProfileSetting(),
      binding: ChangeProfileSettingBinding(),
    ),
         GetPage(
      name: Routes.CALL,
      page: () => Call(),
      binding: CallBinding(),
    ),
             GetPage(
      name: Routes.CHART,
      page: () => Chat(),
      binding: ChatBinding(),
    ),

                         GetPage(
      name: Routes.UPLOAD,
      page: () => Upload(),
      binding: UploadBinding(),
    ),
      GetPage(
      name: Routes.CHOMEVIEW,
      page: () => ConsultantHomeView(),
      binding: ConsultantHomeBinding(),
    ),
    
          GetPage(
      name: Routes.WITHDRAWCON,
      page: () => WithdrawConView(),
      binding: WithdrawConBinding(),
    ),

    GetPage(
      name: Routes.FORGOTPAASWORD,
      page: () =>  ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.RESETPASSWORD,
      page: () =>  ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
     GetPage(
      name: Routes.VERIFYEMAIL,
      page: () => VerifyEmailView(),
      binding: VerifyEmailBinding(),
    ),
         GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
             GetPage(
      name: Routes.ARTICLE,
      page: () => Article(),
      binding: ArticleBinding(),
    ),
                 GetPage(
      name: Routes.SPECIALIZATION,
      page: () => Specialization(),
      binding: SpecializationBinding(),
    ),
  ];
}
