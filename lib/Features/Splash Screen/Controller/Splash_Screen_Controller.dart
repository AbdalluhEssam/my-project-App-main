import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import '../../../Model/App Routes/App_Route_Model.dart';

class SplashScreenController extends GetxController with GetTickerProviderStateMixin  {
  late final AnimationController animationController;
  late final Animation<double> animation;
  late final AnimationController spinKitController;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    );

    // Initialize SpinKit controller
    spinKitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    Future.delayed(const Duration(seconds: 3)).then((_) {
      Get.offAllNamed(AppRoute.onBoarding);
    });

    _initializeSplash();
  }

  void _initializeSplash() async {
    await Future.delayed(const Duration(milliseconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  void onClose() {
    animationController.dispose();
    spinKitController.dispose();
    super.onClose();
  }
}
