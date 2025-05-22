import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/Constant/Buttons/Buttons.dart';
import '../../../../../core/Constant/Colors/Colors.dart';
import '../../../../../core/Constant/Fonts/Fonts.dart';
import '../../../../../core/Constant/Images/Images.dart';
import '../../../../../core/Constant/Theme/Them_Service.dart';
import '../Widget/Student_Setting_Widget.dart';
import 'Student_Setting_Project_Details_View.dart';

class StudentSettingScreenView extends StatefulWidget {
  const StudentSettingScreenView({super.key});

  @override
  State<StudentSettingScreenView> createState() =>
      _StudentSettingScreenViewState();
}

class _StudentSettingScreenViewState extends State<StudentSettingScreenView> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      ThemeService().switchTheme();
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle, color: Theme.of(context).scaffoldBackgroundColor),
                          child: Center(
                            child: LocalImage(
                              localImagePath: ThemeService().themeImage,
                              widthImage: 0.08,
                              heightImage: 0.1,
                              colorImage: orangeColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SecondButton(nameButton: "الإعدادات")],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1.5
                )
                //color: Theme.of(context).primaryColor
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Get.width * 0.3,
                    height: Get.height * 0.11,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: greyColor),
                    child: const LocalSvgImage(
                      localImagePath: "leader.svg",
                      widthImage: 0.1,
                      heightImage: 0.04,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: Get.width * 0.7,
                    child: Text(
                      "محمود ابراهيم عبدالسلام عبدالمنعم",
                      style: smallBlackColor,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: Get.width * 0.7,
                    child: Text(
                      "الفرقة الرابعة نظم المعلومات",
                      style: smallBlackColor,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: Get.width * 0.7,
                    child: Text(
                      "521894",
                      style: smallBlackColor,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: orangeColor,
                  width: 1.5,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Switch(
                      value: isSwitched,
                      activeColor: orangeColor,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      }),
                  const Spacer(),
                  Text(
                    "غلق الإشعارات",
                    style: smallBlackColor,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.notifications_active_outlined,
                    color: orangeColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            StudentSettingWidget(
              settingName: "اسم المشروع",
              settingIcon: Icons.text_snippet_outlined,
              onClickButton: () {
                Get.to(const StudentSettingProjectDetailsView());
              },
            ),
            const StudentSettingWidget(
                settingName: "الموافقة علي التبديلات",
                settingIcon: Icons.repeat),
            const StudentSettingWidget(
                settingName: "التكليفات",
                settingIcon: Icons.monetization_on_outlined),
            const StudentSettingWidget(
                settingName: "التحذيرات", settingIcon: Icons.error_outline),
            const StudentSettingWidget(
                settingName: "من نحن", settingIcon: Icons.error_outline),
            const StudentSettingWidget(
                settingName: "تسجيل الخروج", settingIcon: Icons.login_rounded),
            SizedBox(
              height: Get.height * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}
