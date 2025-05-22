import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/Constant/Images/Images.dart';
import '../../Controller/Splash_Screen_Controller.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});

  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizeTransition(
                  sizeFactor: controller.animation,
                  axis: Axis.vertical,
                  axisAlignment: -1,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: LocalImageWithoutColor(
                          localImagePath: "logo.png",
                          widthImage: Get.width,
                          heightImage: 0.17,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
