import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/Features/Doctor%20Login/Controller/Doctor_Login_Controller.dart';
import 'package:my_project/core/Constant/Buttons/Buttons.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import '../../../../Model/Handling Data/Handling_Data_Status.dart';
import '../../../../core/Constant/Exit_App/ExitApp.dart';
import '../../../../core/Constant/Images/Images.dart';
import '../../../../core/Constant/Validator/Validators.dart';
import '../../../Student Login/Screen/Widget/Student_Sign_In_Widget.dart';

class DoctorLoginView extends StatefulWidget {
  const DoctorLoginView({super.key});

  @override
  State<DoctorLoginView> createState() => _DoctorLoginViewState();
}

class _DoctorLoginViewState extends State<DoctorLoginView> {
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
          body: GetBuilder<DoctorLoginControllerImp>(
              init: DoctorLoginControllerImp(),
              builder: (controller) => HandlingDataRequest(
                //statusRequest: controller.statusRequest,
                  widget: SingleChildScrollView(
                    child: Form(
                      key: controller.doctorLoginFormKey,
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
                                    "تسجيل دخول الدكتور",
                                    style: bigstBlackColor,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFormField(
                                  hintText: "كود الدكتور",
                                  iconOfTextFormField: Icons.person_3_outlined,
                                  myController: controller.doctorCode,
                                  validator: (val) {
                                    return validatorInput(val!, "code_doctor");
                                  },
                                  keyboardType: TextInputType.number),
                              CustomTextFormFieldPassword(
                                hintText: "الرقم السري",
                                myController: controller.doctorPassword,
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
                                  controller.doctorLogin();
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

// class _DoctorLoginViewState extends State<DoctorLoginView> {
//   late final GlobalKey<FormState> formKey;
//   late final TextEditingController code;
//   late final TextEditingController password;
//
//   @override
//   void initState() {
//     super.initState();
//     formKey = GlobalKey<FormState>();
//     code = TextEditingController();
//     password = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     code.dispose();
//     password.dispose();
//     super.dispose();
//   }
//
//   Future<bool> onWillPop() async {
//     final dialog = ExitApp(context);
//     return await dialog.show();
//   }
//
//   void loginDoctorSuccess() {
//     final myServices = Get.find<MyServices>();
//
//     myServices.sharedPreferences.setBool("isLoggedIn", true); // ✅ تسجيل الدخول
//     myServices.sharedPreferences.setString("userType", "doctor");
//
//     Get.offAllNamed(
//         AppRoute.mainScreenDoctorsView); // ✅ الانتقال للصفحة الرئيسية
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const ArrowBackButton(),
//               const SizedBox(
//                 height: 15,
//               ),
//               const LocalSvgImage(
//                   localImagePath: "logo.svg",
//                   widthImage: 0.5,
//                   heightImage: 0.2),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "التسجيل",
//                     style: bigstBlackColor,
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               CustomTextFormField(
//                   hintText: "كود الدكتور",
//                   iconOfTextFormField: Icons.person_3_outlined,
//                   myController: code,
//                   validator: (val) {
//                     return validatorInput(val!, "code_doctor");
//                   },
//                   keyboardType: TextInputType.number),
//               CustomTextFormFieldPassword(
//                 hintText: "الرقم السري",
//                 myController: password,
//                 validator: (val) {
//                   return validatorInput(val!, "pass");
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               MainButton(
//                 nameButton: "تسجيل الدخول",
//                 onClickButton: () {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();
//                     loginDoctorSuccess();
//                   }
//                 },
//               ),
//               SizedBox(height: Get.height * 0.06),
//               LocalSvgImage(
//                   localImagePath: "Frame 32.svg",
//                   widthImage: Get.width,
//                   heightImage: 0.035),
//               SizedBox(height: Get.height * 0.02),
//               const SocialMedia(),
//               SizedBox(height: Get.height * 0.04),
//               const LocalImageWithoutColor(
//                   localImagePath: "logoooooooooo.png",
//                   widthImage: 0.3,
//                   heightImage: 0.1),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
