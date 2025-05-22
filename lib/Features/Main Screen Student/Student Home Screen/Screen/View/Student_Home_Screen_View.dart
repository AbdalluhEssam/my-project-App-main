import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/Model/App%20Routes/App_Route_Model.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import '../../../../../Model/Handling Data/Handling_Data_Status.dart';
import '../../../../../core/Constant/App_Bar/AppBar.dart';
import '../../Controller/Student_Home_Screen_Controller.dart';
import 'All_Members_View.dart';
import 'Responsible_Doctor_View.dart';
import 'Student_Profile_View.dart';
import 'Team_Leader_View.dart';

class StudentHomeScreenView extends StatefulWidget {
  const StudentHomeScreenView({super.key});

  @override
  State<StudentHomeScreenView> createState() => _StudentHomeScreenViewState();
}

class _StudentHomeScreenViewState extends State<StudentHomeScreenView> {
  List<String> items = [
    "المسؤول",
    "قائد المشروع",
    "الكل",
  ];

  int current = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarScreen(
          onClickButton: () {
            Get.toNamed(AppRoute.studentProfileView);
          },
        ),
        body: GetBuilder<StudentHomeScreenControllerImp>(
            init: StudentHomeScreenControllerImp(),
            builder: (controller) => HandlingDataRequest(
                  widget: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 5, top: 5),
                          width: Get.width,
                          // height: Get.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color:
                                  Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all(color: orangeColor)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              // Distribute items
                              children: List.generate(items.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                      print(current);
                                    });
                                  },
                                  child: AnimatedContainer(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    duration:
                                        const Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                        color: current == index
                                            ? orangeColor
                                            : Theme.of(context)
                                                .scaffoldBackgroundColor,
                                        borderRadius: current == index
                                            ? BorderRadius.circular(8)
                                            : BorderRadius.circular(8),
                                        border: current == index
                                            ? Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 1.5,
                                              )
                                            : Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 1.5,
                                              )),
                                    height: Get.height * 0.05,
                                    child: Center(
                                      child: Text(
                                        items[index],
                                        style: bigBlackColor,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      current == 2 ? const AllMembersView() : const SizedBox(),
                      current == 1 ? const TeamLeaderView() : const SizedBox(),
                      current == 0 ? const ResponsibleDoctorView() : const SizedBox(),
                    ],
                  ),
                )));
  }
}
