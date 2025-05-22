import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/Model/App%20Routes/App_Route_Model.dart';
import 'package:my_project/core/Constant/Buttons/Buttons.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Images/Images.dart';
import '../../../../../Model/Handling Data/Handling_Data_Status.dart';
import '../../../../../Model/My Services/My_Services_Model.dart';
import '../../../../../core/Constant/Fonts/Fonts.dart';
import '../../../../../core/Constant/Theme/Them_Service.dart';
import '../../../../Student Login/Controller/Student_Login_Controller.dart';
import '../../Controller/Student_Home_Screen_Controller.dart';
import '../Widget/Student_Profile_Widget.dart';
import 'Team_Leader_View.dart';

class StudentProfileView extends StatefulWidget {
  const StudentProfileView({super.key});

  @override
  State<StudentProfileView> createState() => _StudentProfileViewState();
}

class _StudentProfileViewState extends State<StudentProfileView> {

  void logOutStudent() async {
    final myServices = Get.find<MyServices>();

    myServices.sharedPreferences.getString("onboarding") == "1";
    await myServices.sharedPreferences.remove("isLoggedIn");
    await myServices.sharedPreferences.remove("userType");
    await myServices.sharedPreferences.remove("team_member_student_id");

    Get.offAllNamed(AppRoute.chooseDepartment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<StudentLoginControllerImp>(
            init: StudentLoginControllerImp(),
            builder: (controller) => HandlingDataRequest(
                  //statusRequest: controller.statusRequest,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5,
                                right: 5
                            ),
                            child: GestureDetector(
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
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor),
                                    child: Center(
                                      child: LocalImage(
                                        localImagePath:
                                        ThemeService().themeImage,
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
                          ),
                          const ArrowBackButton(),
                        ],
                      ),
                      StudentProfileWidget(
                        profileStudentImage: "member.svg",
                        profileStudentName: controller.stdName.toString(),
                        profileStudentCode: controller.stdCode.toString(),
                      ),
                      // const TeamLeaderView(),
                      const SizedBox(
                        height: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          logOutStudent();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: orangeColor, width: 1.5)),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "تسجيل الخروج",
                                          style: bigBlackColor,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.login_outlined,
                                          color: orangeColor,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      LocalSvgImage(
                          localImagePath: "Frame 32.svg",
                          widthImage: Get.width,
                          heightImage: 0.035),
                      const SocialMedia(),
                      SizedBox(height: Get.height * 0.04),
                      const LocalImageWithoutColor(
                          localImagePath: "logoooooooooo.png",
                          widthImage: 0.3,
                          heightImage: 0.1),
                    ],
                  ),
                )));
  }
}
