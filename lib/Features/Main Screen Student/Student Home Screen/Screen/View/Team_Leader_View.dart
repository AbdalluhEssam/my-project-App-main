import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Student_Home_Screen_Controller.dart';
import '../Widget/Team_Leader_Widget.dart';

class TeamLeaderView extends StatefulWidget {
  const TeamLeaderView({super.key});

  @override
  State<TeamLeaderView> createState() => _TeamLeaderViewState();
}

class _TeamLeaderViewState extends State<TeamLeaderView> {
  StudentHomeScreenControllerImp controller = Get.put(StudentHomeScreenControllerImp());

  @override
  Widget build(BuildContext context) {
    var teamLeader = controller.teamMembers.firstWhere(
      (member) => member['team_member_is_leader'] == 1,
      orElse: () => null,
    );

    return Column(
      children: [
        if (teamLeader != null)
          TeamLeaderWidget(
            teamLeaderImage: "leader.svg",
            teamLeaderName: teamLeader['team_member_name'],
            teamLeaderId: teamLeader['team_member_code'].toString(),
          )
        else
          const Text("لا يوجد قائد للفريق حالياً",
              style: TextStyle(color: Colors.red)),
      ],
    );
  }
}

// class _TeamLeaderViewState extends State<TeamLeaderView> {
//
//   StudentHomeScreenControllerImp controller = Get.put(StudentHomeScreenControllerImp());
//
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         TeamLeaderWidget(
//           teamLeaderImage: "leader.svg",
//           teamLeaderName: "محمود ابراهيم عبدالسلام عبدالمنعم",
//           teamLeaderId: "621894",
//         )
//       ],
//     );
//   }
// }
