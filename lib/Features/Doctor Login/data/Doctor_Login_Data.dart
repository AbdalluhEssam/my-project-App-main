import '../../../Model/Crud/Crud_Model.dart';
import '../../../Model/Link Api/Link_Api_Model.dart';

class DoctorLoginData {
  Crud crud;

  DoctorLoginData(this.crud);

  postdata(String doctorCode, String doctorPassword) async {
    var response = await crud.postData(AppLink.doctorLogin, {
      "doctor_code": doctorCode,
      "doctor_password": doctorPassword,
    });
    print('Raw response: $response'); // Debugging line
    return response.fold((l) => l, (r) => r);
  }
}