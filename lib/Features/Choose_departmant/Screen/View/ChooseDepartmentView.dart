import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/Model/App%20Routes/App_Route_Model.dart';
import 'package:my_project/core/Constant/Buttons/Buttons.dart';
import 'package:my_project/core/Constant/Images/Images.dart';
import '../../../../Model/My Services/My_Services_Model.dart';

class ChooseDepartmentView extends StatefulWidget {
  const ChooseDepartmentView({super.key});

  @override
  State<ChooseDepartmentView> createState() => _ChooseDepartmentViewState();
}

class _ChooseDepartmentViewState extends State<ChooseDepartmentView> {
  final myServices = Get.find<MyServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: Get.height * 0.15),
            const LocalSvgImage(
                localImagePath: "logo.svg",
                widthImage: 0.5,
                heightImage: 0.18),
            SizedBox(height: Get.height * 0.1),
            SecondButton(
              nameButton: "طالب",
              onClickButton: () async {
                await myServices.sharedPreferences
                    .setString("userType", "student");
                print("🔹 userType = student");
                Get.toNamed(AppRoute.studentLogin);
              },
            ),
            SecondButton(
              nameButton: "دكتور",
              onClickButton: () async {
                await myServices.sharedPreferences
                    .setString("userType", "doctor");
                print("🔹 userType = doctor");
                Get.toNamed(AppRoute.doctorLogin);
              },
            ),
            SecondButton(
              nameButton: "خريج",
              onClickButton: () {
                print("خريج");
              },
            ),
            SizedBox(height: Get.height * 0.15),
             const LocalImageWithoutColor(
                localImagePath: "logoooooooooo.png",
                widthImage: 0.3,
                heightImage: 0.1),
          ],
        ),
      ),
    );
  }
}
