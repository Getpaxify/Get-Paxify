import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paxify/theme/app_colors.dart';


class OnboardingState {
  List<OnboardingContent> onboarding = [
    OnboardingContent(
        image: 'images/Frame1.png',
        subtitle: 'Affordable online sessions with licensed professionals at your fingertips.',
        title: 'Therapy On The Go',
        color: primaryColor,
        addT: ''),
    OnboardingContent(
        image: 'images/Frame2.png',
        subtitle: 'Journaling and mood check-ins to help you stay in tune with your emotions.',
        title: 'Track Your Mood',
        addT: '',
        color: const Color(0xffF9D206)),
    OnboardingContent(
        image: 'images/Frame3.png',
        subtitle: 'Enjoy the flexibility to convert your airtime to cash.',
        title: 'Read And Reflect',
        addT: '',
        color: const Color(0xff00923F)),
  ];
  RxInt index = 0.obs;
}

class OnboardingContent {
  final String image;
  final String title;
  final String addT;
  final String subtitle;
  final Color? color;
  OnboardingContent(
      {required this.image,
      this.color,
      required this.subtitle,
      required this.title,
      required this.addT});
}
