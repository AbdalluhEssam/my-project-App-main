import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Buttons/Buttons.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import '../../../../../core/Constant/Images/Images.dart';
import '../../../../../core/Constant/Validator/Validators.dart';
import '../../../../Student Login/Screen/Widget/Student_Sign_In_Widget.dart';

class StudentChangeScreenView extends StatefulWidget {
  const StudentChangeScreenView({super.key});

  @override
  State<StudentChangeScreenView> createState() =>
      _StudentChangeScreenViewState();
}

class _StudentChangeScreenViewState extends State<StudentChangeScreenView> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController addMember;
  late final TextEditingController removeMember;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    addMember = TextEditingController();
    removeMember = TextEditingController();
  }

  @override
  void dispose() {
    addMember.dispose();
    removeMember.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.08,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SecondButton(nameButton: "التبديلات")],
              ),
              LocalImage(
                localImagePath: "interaction.png",
                widthImage: 0.25,
                heightImage: 0.2,
                colorImage: orangeColor,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width * 0.9,
                child: const Text(
                  textAlign: TextAlign.center,
                  "تمكنك من التبديل بين اعضاء مجموعتك",
                  style: smallGreyColor,
                ),
              ),
              SizedBox(
                width: Get.width * 0.9,
                child: const Text(
                  textAlign: TextAlign.center,
                  "و مجموعة اخري",
                  style: smallGreyColor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                  hintText: "أدخل كود الطالب للأضافة",
                  iconOfTextFormField: Icons.person,
                  myController: addMember,
                  validator: (val) {
                    return validatorInput(val!, "code");
                  },
                  keyboardType: TextInputType.number),
              CustomTextFormField(
                  hintText: "أدخل كود الطالب للأزالة",
                  iconOfTextFormField: Icons.person,
                  myController: removeMember,
                  validator: (val) {
                    return validatorInput(val!, "code");
                  },
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: MainButton(
                  nameButton: "حفظ",
                  onClickButton: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      ("uri", addMember!, removeMember!);
                      ("$addMember || $removeMember");
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1
                                )
                              ),
                              title: const LocalImage(
                                localImagePath: "success.png",
                                widthImage: 0.25,
                                heightImage: 0.1,
                                colorImage: orangeColor,
                              ),
                              content: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                      textAlign: TextAlign.center,
                                      style: verySmallBlackColor,
                                      "تم ارسال طلب التبديل الي دكتور المشروع انتظر الموافقة")),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, right: 30),
                                          child: Container(
                                            width: Get.width * 0.45,
                                            decoration: BoxDecoration(
                                              color: orangeColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "تم",
                                                  style: bigWhiteColor,
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    }
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
