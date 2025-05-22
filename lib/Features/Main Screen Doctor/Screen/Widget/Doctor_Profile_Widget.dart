import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import '../../../../core/Constant/Fonts/Fonts.dart';
import '../../../../core/Constant/Images/Images.dart';

class DoctorProfileWidget extends StatefulWidget {
  final String profileDoctorImage;
  final String profileDoctorName;
  final String profileDoctorCode;

  const DoctorProfileWidget(
      {super.key,
      required this.profileDoctorImage,
      required this.profileDoctorName,
      required this.profileDoctorCode});

  @override
  State<DoctorProfileWidget> createState() => _DoctorProfileWidgetState();
}

class _DoctorProfileWidgetState extends State<DoctorProfileWidget> {
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
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: LocalSvgImage(
              localImagePath: widget.profileDoctorImage,
              widthImage: 0.1,
              heightImage: 0.04,
            ),
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
              widget.profileDoctorName,
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
              widget.profileDoctorCode,
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
