import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/Constant/Colors/Colors.dart';
import '../../../../../core/Constant/Fonts/Fonts.dart';
import '../../../../../core/Constant/Images/Images.dart';

class DoctorWidget extends StatefulWidget {
  final String doctorImage;
  final String doctorName;

  const DoctorWidget(
      {super.key, required this.doctorImage, required this.doctorName});

  @override
  State<DoctorWidget> createState() => _DoctorWidgetState();
}

class _DoctorWidgetState extends State<DoctorWidget> {
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
          padding: const EdgeInsets.all(20),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: greyColor),
          child: LocalSvgImage(
            localImagePath: widget.doctorImage,
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
              "د / ${widget.doctorName}",
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
