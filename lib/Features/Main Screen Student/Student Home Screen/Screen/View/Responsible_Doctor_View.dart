import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Student_Home_Screen_Controller.dart';
import '../Widget/Doctor_Widget.dart';

class ResponsibleDoctorView extends StatefulWidget {
  const ResponsibleDoctorView({super.key});

  @override
  State<ResponsibleDoctorView> createState() => _ResponsibleDoctorViewState();
}

class _ResponsibleDoctorViewState extends State<ResponsibleDoctorView> {
  @override
  Widget build(BuildContext context) {
    StudentHomeScreenControllerImp controller = Get.put(StudentHomeScreenControllerImp());

    String doctorName = controller.teamMembers.isNotEmpty
        ? controller.teamMembers.first['team_member_doctor_name'] ?? "لا يوجد دكتور مسؤول عن للفريق حاليا"
        : "لا يوجد دكتور مسؤول عن للفريق حاليا";

    return SizedBox(
      height: Get.height * 0.65,
      child: Column(
        children: [
          DoctorWidget(
            doctorImage: "doctor.svg",
            doctorName: doctorName,
          ),
        ],
      ),
    );
  }
}

// class _ResponsibleDoctorViewState extends State<ResponsibleDoctorView> {
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         DoctorWidget(
//             doctorImage: "doctor.svg", doctorName: "عبدالسلام عبدالمنعم محمود")
//       ],
//     );
//   }
// }
