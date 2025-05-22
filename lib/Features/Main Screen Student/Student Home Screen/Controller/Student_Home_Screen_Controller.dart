import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Model/Handling Data/Handling_Data_Model.dart';
import '../../../../Model/My Services/My_Services_Model.dart';
import '../../../../Model/Status Request/Status_Request_model.dart';
import '../data/Student_Home_Screen_Data.dart';

abstract class StudentHomeScreenController extends GetxController {
  initialData();

  getdata(String teamMemberStudentId);
}

class StudentHomeScreenControllerImp extends StudentHomeScreenController {
  StudentHomeScreenData studentHomeScreenData = StudentHomeScreenData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  var currentIndex = 0.obs;
  List teamMembers = [];
  String? studentName;
  String? studentCode;
  String? teamMemberStudentId;

  @override
  initialData() {
    studentCode = myServices.sharedPreferences.getString("code");
    studentName = myServices.sharedPreferences.getString("username");
    print("👤 Student Name: $studentName");
    print("👤 Student Code: $studentCode");
  }

  @override
  void onInit() async {
    super.onInit();
    initialData();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    teamMemberStudentId = prefs.getString("team_member_student_id");

    if (teamMemberStudentId != null && teamMemberStudentId!.isNotEmpty) {
      print("✅ Loaded teamMemberStudentId from storage: $teamMemberStudentId");
      getdata(teamMemberStudentId!);
    } else {
      print("❌ No saved teamMemberStudentId found. Fetching from server...");
      await fetchTeamMemberStudentId();
    }
  }

  Future<void> fetchTeamMemberStudentId() async {
    statusRequest = StatusRequest.loading;
    update();

    if (studentName == null || studentName!.isEmpty) {
      print("❌ ERROR: Student Name is null or empty!");
      statusRequest = StatusRequest.failure;
      update();
      return;
    }

    if (studentCode == null || studentCode!.isEmpty) {
      print("❌ ERROR: Student Code is null or empty!");
      statusRequest = StatusRequest.failure;
      update();
      return;
    }

    var response = await studentHomeScreenData.fetchTeamMemberId(studentCode!);

    print("🔵 Raw Response for ID: $response");

    if (response is Map && response.containsKey('team_member_student_id')) {
      teamMemberStudentId = response['team_member_student_id'].toString();
      print("✅ Received teamMemberStudentId: $teamMemberStudentId");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("team_member_student_id", teamMemberStudentId!);

      getdata(teamMemberStudentId!);
    } else {
      print("❌ Failed to fetch teamMemberStudentId from server!");
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  getdata(String teamMemberStudentId) async {
    if (teamMemberStudentId.isEmpty) {
      print("❌ ERROR: teamMemberStudentId is empty!");
      statusRequest = StatusRequest.failure;
      update();
      return;
    }

    statusRequest = StatusRequest.loading;
    update();

    var response = await studentHomeScreenData.postdata(teamMemberStudentId);

    print("🔵 Controller Response: $response");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response is Map && response['status'] == "success") {
        teamMembers.addAll(response['team_members']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
}

// abstract class StudentHomeScreenController extends GetxController {
//   initialData();
//   getdata(String teamMemberStudentId);
// }
//
// class StudentHomeScreenControllerImp extends StudentHomeScreenController {
//   StudentHomeScreenData studentHomeScreenData = StudentHomeScreenData(Get.find());
//   StatusRequest statusRequest = StatusRequest.none;
//   MyServices myServices = Get.find();
//   var currentIndex = 0.obs; // Observable for tracking current index
//   List teamMembers = [];
//   String? username;
//
//   @override
//   initialData() {
//     username = myServices.sharedPreferences.getString("username");
//     print("user name is : $username");
//   }
//
//   @override
//   void onInit() {
//     getdata("team_member_student_id");
//     initialData();
//     super.onInit();
//   }
//
//   @override
//   getdata(teamMemberStudentId) async {
//     statusRequest = StatusRequest.loading;
//     var response = await studentHomeScreenData.postdata(teamMemberStudentId);
//     print("================================= Controller Response: $response");
//     print("API Response: $response");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         teamMembers.addAll(response['team_members']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }
// }
