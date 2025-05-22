import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/Model/App%20Routes/App_Route_Model.dart';
import 'package:my_project/core/Constant/App_Bar/AppBar.dart';
import 'package:my_project/core/Constant/Buttons/Buttons.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import 'package:my_project/core/Constant/Images/Images.dart';

import '../../../../core/Constant/Exit_App/ExitApp.dart';
import 'Doctor_Profile_View.dart';

class MainScreenDoctorsView extends StatefulWidget {
  const MainScreenDoctorsView({super.key});

  @override
  State<MainScreenDoctorsView> createState() => _MainScreenDoctorsViewState();
}

class _MainScreenDoctorsViewState extends State<MainScreenDoctorsView> {

  Future<bool> onWillPop() async {
    final dialog = ExitApp(context);
    return await dialog.show();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBarScreen(
          onClickButton: () {
            Get.toNamed(AppRoute.doctorProfileView);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: orangeColor, width: 1.5),
                        ),
                        child: const Center(
                          child: LocalSvgImage(
                              localImagePath:
                                  "Customer relationship management-amico.svg",
                              widthImage: 0.4,
                              heightImage: 0.18),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "التكليفات",
                            style: mediumBlackColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Container(
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: orangeColor, width: 1.5),
                        ),
                        child: const Center(
                          child: LocalSvgImage(
                              localImagePath: "Work in progress-amico.svg",
                              widthImage: 0.4,
                              heightImage: 0.18),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "مشروعاتي",
                            style: mediumBlackColor,
                            textAlign: TextAlign.end,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: Get.width * 0.4,
                      height: Get.height * 0.2,
                      //color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: orangeColor, width: 1.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const LocalSvgImage(
                                      localImagePath: "woman.svg",
                                      widthImage: 0.001,
                                      heightImage: 0.03),
                                  const LocalSvgImage(
                                      localImagePath: "woman.svg",
                                      widthImage: 0.001,
                                      heightImage: 0.03),
                                  const Spacer(),
                                  Text(
                                    "عدد الطلاب",
                                    style: verySmallBlackColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: Get.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: orangeColor, width: 1.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.text_snippet_outlined,
                                      color: orangeColor,
                                    ),
                                    const Spacer(),
                                    Text(
                                      "أسماء المشاريع",
                                      style: verySmallBlackColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: Get.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: orangeColor, width: 1.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.error_outline,
                                      color: orangeColor,
                                    ),
                                    const Spacer(),
                                    Text(
                                      "إرسال إنذار",
                                      style: verySmallBlackColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "",
                                style: mediumBlackColor,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Container(
                        width: Get.width * 0.4,
                        height: Get.height * 0.18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: orangeColor, width: 1.5),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.change_circle_outlined,
                          color: orangeColor,
                          size: 80,
                        )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "التبديلات",
                            style: mediumBlackColor,
                            textAlign: TextAlign.end,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              const MainButton(nameButton: "إرسال تكليف")
            ],
          ),
        ),
      ),
    );
  }
}
