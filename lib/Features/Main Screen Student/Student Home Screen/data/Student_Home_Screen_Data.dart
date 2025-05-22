import '../../../../Model/Crud/Crud_Model.dart';
import '../../../../Model/Link Api/Link_Api_Model.dart';

class StudentHomeScreenData {
  Crud crud;

  StudentHomeScreenData(this.crud);

  // ✅ جلب `team_member_student_id` من السيرفر باستخدام كود المستخدم
  Future<dynamic> fetchTeamMemberId(String teamMemberStudentCode) async {
    var response = await crud.postData(AppLink.getTeamMemberId, {
      "team_member_code": teamMemberStudentCode,
    });
    print('🔵 Fetch Team Member ID Response: $response');
    return response.fold((l) => l, (r) => r);
  }

  // ✅ جلب بيانات الفريق بناءً على `team_member_student_id`
  Future<dynamic> postdata(String teamMemberStudentId) async {
    print('📤 Sending teamMemberStudentId: $teamMemberStudentId');
    var response = await crud.postData(AppLink.studentHomeScreen, {
      "team_member_student_id": teamMemberStudentId,
    });
    print('🔵 Raw response: $response');
    return response.fold((l) => l, (r) => r);
  }
}

// class StudentHomeScreenData {
//   Crud crud;
//
//   StudentHomeScreenData(this.crud);
//
//   postdata(String teamMemberStudentId) async {
//     var response = await crud.postData(AppLink.studentHomeScreen, {
//       "team_member_student_id": teamMemberStudentId.toString(),
//     });
//     print('Raw response: $response'); // Debugging line
//     return response.fold((l) => l, (r) => r);
//   }
// }