import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Buttons/Buttons.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import 'package:my_project/core/Constant/Images/Images.dart';
import '../../../../Model/Handling Data/Handling_Data_Status.dart';
import '../../../../core/Constant/Exit_App/ExitApp.dart';
import '../../../../core/Constant/Validator/Validators.dart';
import '../../Controller/Student_Login_Controller.dart';
import '../Widget/Student_Sign_In_Widget.dart';

class StudentLoginView extends StatefulWidget {
  const StudentLoginView({super.key});

  @override
  State<StudentLoginView> createState() => _StudentLoginViewState();
}

class _StudentLoginViewState extends State<StudentLoginView> {
  Future<bool> onWillPop() async {
    final dialog = ExitApp(context);
    return await dialog.show();
  }

  @override
  Widget build(BuildContext context) {
    //SignInControllerImp controller = Get.put(SignInControllerImp());
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          body: GetBuilder<StudentLoginControllerImp>(
              init: StudentLoginControllerImp(),
              builder: (controller) => HandlingDataRequest(
                      //statusRequest: controller.statusRequest,
                      widget: SingleChildScrollView(
                    child: Form(
                      key: controller.studentLoginFormKey,
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const ArrowBackButton(),
                              const SizedBox(
                                height: 15,
                              ),
                              const LocalSvgImage(
                                  localImagePath: "logo.svg",
                                  widthImage: 0.5,
                                  heightImage: 0.2),
                              const SizedBox(
                                height: 30,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "تسجيل دخول الطالب",
                                    style: bigstBlackColor,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFormField(
                                  hintText: "كود الطالب",
                                  iconOfTextFormField: Icons.person_3_outlined,
                                  myController: controller.studentCode,
                                  validator: (val) {
                                    return validatorInput(val!, "code");
                                  },
                                  keyboardType: TextInputType.number),
                              CustomTextFormFieldPassword(
                                hintText: "الرقم السري",
                                myController: controller.studentPassword,
                                validator: (val) {
                                  return validatorInput(val!, "pass");
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MainButton(
                                nameButton: "تسجيل الدخول",
                                onClickButton: () {
                                  controller.studentLogin();
                                },
                              ),
                              SizedBox(height: Get.height * 0.06),
                              LocalSvgImage(
                                  localImagePath: "Frame 32.svg",
                                  widthImage: Get.width,
                                  heightImage: 0.035),
                              SizedBox(height: Get.height * 0.02),
                              const SocialMedia(),
                              SizedBox(height: Get.height * 0.04),
                              const LocalImageWithoutColor(
                                  localImagePath: "logoooooooooo.png",
                                  widthImage: 0.3,
                                  heightImage: 0.1),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )))),
    );
  }
}
