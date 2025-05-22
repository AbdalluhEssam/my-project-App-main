import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/Features/Main%20Screen%20Doctor/Screen/Widget/Doctor_Profile_Widget.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import '../../../../Model/App Routes/App_Route_Model.dart';
import '../../../../Model/Handling Data/Handling_Data_Status.dart';
import '../../../../Model/My Services/My_Services_Model.dart';
import '../../../../core/Constant/Buttons/Buttons.dart';
import '../../../../core/Constant/Images/Images.dart';
import '../../../../core/Constant/Theme/Them_Service.dart';
import '../../../Doctor Login/Controller/Doctor_Login_Controller.dart';

class DoctorProfileView extends StatefulWidget {
  const DoctorProfileView({super.key});

  @override
  State<DoctorProfileView> createState() => _DoctorProfileViewState();
}

class _DoctorProfileViewState extends State<DoctorProfileView> {

  void logOutDoctor() async {
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
        body: GetBuilder<DoctorLoginControllerImp>(
            init: DoctorLoginControllerImp(),
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
                      DoctorProfileWidget(
                        profileDoctorImage: "doctor.svg",
                        profileDoctorName: controller.docName.toString(),
                        profileDoctorCode: controller.docCode.toString(),
                      ),
                      //const ResponsibleDoctorView(),
                      const SizedBox(
                        height: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          logOutDoctor();
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
                        height: Get.height * 0.05,
                      ),
                      LocalSvgImage(
                          localImagePath: "Frame 32.svg",
                          widthImage: Get.width,
                          heightImage: 0.035),
                      // const SizedBox(
                      //   height: 10,
                      // ),
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
