import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Model/Status Request/Status_Request_model.dart';
import '../../Controller/Student_Home_Screen_Controller.dart';
import '../Widget/All_Members_Widget.dart';

class AllMembersView extends StatefulWidget {
  const AllMembersView({super.key});

  @override
  State<AllMembersView> createState() => _AllMembersViewState();
}

class _AllMembersViewState extends State<AllMembersView> {
  @override
  Widget build(BuildContext context) {
    StudentHomeScreenControllerImp controller = Get.put(StudentHomeScreenControllerImp());

    List sortedTeamMembers = List.from(controller.teamMembers);
    sortedTeamMembers.sort((a, b) => b['team_member_is_leader'].compareTo(a['team_member_is_leader']));

    return SizedBox(
      height: Get.height * 0.65,
      //color: Colors.red,
      child: controller.teamMembers.isEmpty ? const Text("لا يوجد بيانات") : ListView.builder(
        itemCount: sortedTeamMembers.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Row(
            children: [
              AllMembersWidget(
                memberImage:
                    sortedTeamMembers[index]['team_member_is_leader'] == 1
                        ? "leader.svg"
                        : "member.svg",
                memberName: sortedTeamMembers[index]['team_member_name'],
                memberId:
                    sortedTeamMembers[index]['team_member_code'].toString(),
                memberJopTitle:
                    sortedTeamMembers[index]['team_member_is_leader'] == 1
                        ? "القائد"
                        : "عضو",
              ),
            ],
          );
        },
      ),
    );
  }
}

// class _AllMembersViewState extends State<AllMembersView> {
//   @override
//   Widget build(BuildContext context) {
//     StudentHomeScreenControllerImp controller = Get.put(StudentHomeScreenControllerImp());
//
//     return SizedBox(
//       height: Get.height * 0.65,
//       //color: Colors.purpleAccent,
//       child: ListView.builder(
//         itemCount: controller.teamMembers.length,
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           return Row(
//             children: [
//               AllMembersWidget(
//                 memberImage: controller.teamMembers[index]['team_member_is_leader'] == 1 ? "leader.svg" : "member.svg",
//                 memberName: controller.teamMembers[index]['team_member_name'],
//                 memberId: controller.teamMembers[index]['team_member_code'].toString(),
//                 memberJopTitle: controller.teamMembers[index]['team_member_is_leader'] == 1 ? "القائد" : "عضو",
//               ),
//             ],
//           );
//         },
//       ));
//   }
// }

// class _AllMembersViewState extends State<AllMembersView> {
//   @override
//   Widget build(BuildContext context) {
//     StudentHomeScreenControllerImp controller = Get.put(StudentHomeScreenControllerImp());
//     return Container(
//       height: Get.height * 0.65,
//       color: Colors.purpleAccent,
//       child: ListView.builder(
//           itemCount: controller.teamMembers.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return Row(children: [
//               AllMembersWidget(
//                   memberImage: "leader.svg",
//                   memberName: controller.teamMembers[index]['team_member_name'],
//                   memberId: "521894",
//                   memberJopTitle: "القائد"),
//             ]);
//           }),
//     );
//   }
// }
