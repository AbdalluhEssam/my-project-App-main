import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';

class StudentSettingWidget extends StatefulWidget {
  final String settingName;
  final IconData settingIcon;
  final void Function()? onClickButton;

  const StudentSettingWidget(
      {super.key,
      required this.settingName,
      required this.settingIcon,
      this.onClickButton});

  @override
  State<StudentSettingWidget> createState() => _StudentSettingWidgetState();
}

class _StudentSettingWidgetState extends State<StudentSettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: widget.onClickButton,
          child: Container(
            width: Get.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: orangeColor,
                width: 1.5,
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Text(
                      widget.settingName,
                      style: smallBlackColor,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      widget.settingIcon,
                      color: orangeColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        // const SizedBox(
        //   height: 5,
        // ),
      ],
    );
  }
}
