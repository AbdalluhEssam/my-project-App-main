import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import '../../../../../core/Constant/Buttons/Buttons.dart';
import '../Widget/Student_Upload_File_Widget.dart';

class StudentUploadFilesView extends StatefulWidget {
  const StudentUploadFilesView({super.key});

  @override
  State<StudentUploadFilesView> createState() => _StudentUploadFilesViewState();
}

class _StudentUploadFilesViewState extends State<StudentUploadFilesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ArrowBackButton(),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SecondButton(nameButton: "شروط الملف")],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.85,
              decoration: BoxDecoration(
                border: Border.all(color: orangeColor, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              "20 ميغابايت",
                              style: verySmallOrangeColor,
                            ),
                          ),
                          Text(
                            " : أقصي حجم للملف",
                            style: verySmallGreyColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.85,
              decoration: BoxDecoration(
                border: Border.all(color: orangeColor, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "20",
                            style: verySmallOrangeColor,
                          ),
                          Text(
                            " : أقصي عدد للملفات",
                            style: verySmallGreyColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.85,
              decoration: BoxDecoration(
                border: Border.all(color: orangeColor, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Png _ Jpg _ Pdf",
                            style: verySmallOrangeColor,
                          ),
                          Text(
                            " : الصيغ المتاحة",
                            style: verySmallGreyColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            const StudentUploadFileWidget(),
          ],
        ),
      ),
    );
  }
}
