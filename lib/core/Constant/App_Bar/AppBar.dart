import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Images/Images.dart';
import '../Colors/Colors.dart';

class AppBarScreen extends StatefulWidget implements PreferredSizeWidget {
  final void Function()? onClickButton;
  const AppBarScreen({super.key, this.onClickButton});

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Get.height * 0.1);
}

class _AppBarScreenState extends State<AppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: null,
              actions: [
                GestureDetector(
                  onTap: widget.onClickButton,
                  child: const LocalImage(
                    localImagePath: "user.png",
                    widthImage: 0.1,
                    heightImage: 0.035,
                    colorImage: orangeColor,
                  ),
                ),
              ],
              title: const Row(
                children: [
                  LocalSvgImage(
                      localImagePath: "Group.svg",
                      widthImage: 0.1,
                      heightImage: 0.06),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "My Project",
                    style: TextStyle(
                        color: Color(0xffCD2727),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Color(0xffCD2727),
            thickness: 1,
            height: 5,
          ),
        ],
      ),
    );
  }

}
