import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashState {
  late AnimationController controller;

  SplashState({required AnimationController animationController}) {
    controller = animationController;
  }
  RxString token = ''.obs;
}
