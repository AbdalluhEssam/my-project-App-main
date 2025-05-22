import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import '../../../../../core/Constant/Images/Images.dart';

class StudentSuccessUploadFileWidget extends StatefulWidget {
  final String nameFile;
  final String kindFile;
  final String summitDate;
  final void Function()? onClickButton;

  const StudentSuccessUploadFileWidget(
      {super.key,
      required this.nameFile,
      required this.kindFile,
      required this.summitDate,
      this.onClickButton});

  @override
  State<StudentSuccessUploadFileWidget> createState() =>
      _StudentSuccessUploadFileWidgetState();
}

class _StudentSuccessUploadFileWidgetState extends State<StudentSuccessUploadFileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClickButton,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1.5, color: orangeColor)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       LocalImage(
                        localImagePath: "file.png",
                        widthImage: 0.15,
                        heightImage: 0.05,
                        colorImage: Theme.of(context).primaryColor,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "اسم الملف : ",
                                style: verySmallOrangeColor,
                              ),
                              SizedBox(
                                width: Get.width * 0.5,
                                //color: Colors.red,
                                child: Text(
                                  widget.nameFile,
                                  style: verySmallBlackColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "نوع الملف : ",
                                style: verySmallOrangeColor,
                              ),
                              SizedBox(
                                width: Get.width * 0.5,
                                //color: Colors.blue,
                                child: Text(
                                  widget.kindFile,
                                  style: verySmallBlackColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "تم التسليم في تاريخ : ",
                                style: verySmallOrangeColor,
                              ),
                              SizedBox(
                                width: Get.width * 0.35,
                                //color: Colors.green,
                                child: Text(
                                  widget.summitDate,
                                  style: verySmallBlackColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
