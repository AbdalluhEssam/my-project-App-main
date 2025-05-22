import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/Constant/Colors/Colors.dart';
import '../../../../../core/Constant/Fonts/Fonts.dart';
import '../../../../../core/Constant/Images/Images.dart';

class TeamLeaderWidget extends StatefulWidget {
  final String teamLeaderImage;
  final String teamLeaderName;
  final String teamLeaderId;

  const TeamLeaderWidget(
      {super.key,
      required this.teamLeaderImage,
      required this.teamLeaderName,
      required this.teamLeaderId});

  @override
  State<TeamLeaderWidget> createState() => _TeamLeaderWidgetState();
}

class _TeamLeaderWidgetState extends State<TeamLeaderWidget> {
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
            localImagePath: widget.teamLeaderImage,
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
              widget.teamLeaderName,
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
              widget.teamLeaderId,
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
