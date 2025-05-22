import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import 'package:my_project/core/Constant/Images/Images.dart';

class AllMembersWidget extends StatefulWidget {
  final String memberImage;
  final String memberName;
  final String memberId;
  final String memberJopTitle;

  const AllMembersWidget(
      {super.key,
      required this.memberImage,
      required this.memberName,
      required this.memberId,
      required this.memberJopTitle});

  @override
  State<AllMembersWidget> createState() => _AllMembersWidgetState();
}

class _AllMembersWidgetState extends State<AllMembersWidget> {
  @override
  Widget build(BuildContext context) {

    Color textColor = widget.memberJopTitle == "القائد" ?  const Color(0xffE51818) : Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: Get.width * 0.9,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.memberJopTitle,
                    style: verySmallBlackColor.copyWith(color: textColor),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    SizedBox(
                      width: Get.width * 0.55,
                      //color: Colors.green,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          widget.memberName,
                          style: smallRedColor.copyWith(color: textColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.55,
                      //color: Colors.green,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          widget.memberId,
                          style: smallRedColor.copyWith(color: textColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: Get.width * 0.13,
                  height: Get.height * 0.08,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: greyColor),
                  child: LocalSvgImage(
                      localImagePath: widget.memberImage,
                      widthImage: 0.1,
                      heightImage: 0.04,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
