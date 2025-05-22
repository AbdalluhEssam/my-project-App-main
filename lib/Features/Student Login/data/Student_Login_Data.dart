import '../../../Model/Crud/Crud_Model.dart';
import '../../../Model/Link Api/Link_Api_Model.dart';

class StudentLoginData {
  Crud crud;

  StudentLoginData(this.crud);

  postdata(String studentCode, String studentPassword) async {
    var response = await crud.postData(AppLink.studentLogin, {
      "student_code": studentCode,
      "student_password": studentPassword,
    });
    print('Raw response: $response'); // Debugging line
    return response.fold((l) => l, (r) => r);
  }
}

// class StudentLoginData {
//   String? status;
//   Data? data;
//
//   StudentLoginData({this.status, this.data});
//
//   StudentLoginData.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int? studentId;
//   String? studentName;
//   String? studentEmail;
//   String? studentPhone;
//   String? studentDepartment;
//   String? studentCode;
//   String? studentPassword;
//   String? studentConfirmPassword;
//   String? studentCreatedAt;
//
//   Data(
//       {this.studentId,
//         this.studentName,
//         this.studentEmail,
//         this.studentPhone,
//         this.studentDepartment,
//         this.studentCode,
//         this.studentPassword,
//         this.studentConfirmPassword,
//         this.studentCreatedAt});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     studentId = json['student_id'];
//     studentName = json['student_name'];
//     studentEmail = json['student_email'];
//     studentPhone = json['student_phone'];
//     studentDepartment = json['student_department'];
//     studentCode = json['student_code'];
//     studentPassword = json['student_password'];
//     studentConfirmPassword = json['student_confirm_password'];
//     studentCreatedAt = json['student_created_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['student_id'] = this.studentId;
//     data['student_name'] = this.studentName;
//     data['student_email'] = this.studentEmail;
//     data['student_phone'] = this.studentPhone;
//     data['student_department'] = this.studentDepartment;
//     data['student_code'] = this.studentCode;
//     data['student_password'] = this.studentPassword;
//     data['student_confirm_password'] = this.studentConfirmPassword;
//     data['student_created_at'] = this.studentCreatedAt;
//     return data;
//   }
// }
