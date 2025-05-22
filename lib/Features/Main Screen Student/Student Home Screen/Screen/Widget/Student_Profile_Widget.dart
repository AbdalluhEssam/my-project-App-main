import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import '../../../../../core/Constant/Fonts/Fonts.dart';
import '../../../../../core/Constant/Images/Images.dart';

class StudentProfileWidget extends StatefulWidget {
  final String profileStudentImage;
  final String profileStudentName;
  final String profileStudentCode;

  const StudentProfileWidget(
      {super.key,
      required this.profileStudentImage,
      required this.profileStudentName,
      required this.profileStudentCode});

  @override
  State<StudentProfileWidget> createState() => _StudentProfileWidgetState();
}

class _StudentProfileWidgetState extends State<StudentProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: Get.width * 0.3,
          height: Get.height * 0.15,
          padding: const EdgeInsets.all(15),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: greyColor),
          child: LocalSvgImage(
            localImagePath: widget.profileStudentImage,
            widthImage: 0.1,
            heightImage: 0.04,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: Get.width * 0.85,
          //color: Colors.green,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              widget.profileStudentName,
              style: smallBlackColor,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: Get.width * 0.6,
          //color: Colors.green,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              widget.profileStudentCode,
              style: smallBlackColor,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
