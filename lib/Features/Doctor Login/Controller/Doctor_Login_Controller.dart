import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Model/App Routes/App_Route_Model.dart';
import '../../../Model/Handling Data/Handling_Data_Model.dart';
import '../../../Model/My Services/My_Services_Model.dart';
import '../../../Model/Status Request/Status_Request_model.dart';
import '../../../core/Constant/Colors/Colors.dart';
import '../../../core/Constant/SnackBar/Snack_bar.dart';
import '../../../core/Constant/Validator/Validators.dart';
import '../data/Doctor_Login_Data.dart';

abstract class DoctorLoginController extends GetxController {
  doctorLogin();

  goToMainScreenDoctorViewPage();
}

class DoctorLoginControllerImp extends DoctorLoginController {
  final SnackbarService _snackbarService = SnackbarService();
  GlobalKey<FormState> doctorLoginFormKey = GlobalKey<FormState>();
  late TextEditingController doctorCode;
  late TextEditingController doctorPassword;
  DoctorLoginData doctorLoginData = DoctorLoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List data = [];
  String? docName;
  String? docCode;

  var doctorCodeValid = false.obs;
  var doctorPasswordValid = false.obs;

  @override
  void onInit() {
    doctorCode = TextEditingController();
    doctorPassword = TextEditingController();
    docName = myServices.sharedPreferences.getString("username");
    docCode = myServices.sharedPreferences.getString("code");
    super.onInit();
  }

  @override
  void dispose() {
    doctorCode.dispose();
    doctorPassword.dispose();
    super.dispose();
  }

  void validateEmail() {
    String? errorMessage = validatorInput(doctorCode.text, "code_doctor");
    doctorCodeValid.value = errorMessage == null;
  }

  void validatePassword() {
    String? errorMessage = validatorInput(doctorPassword.text, "pass");
    doctorPasswordValid.value = errorMessage == null;
  }

  void loginStudentSuccess() {
    final myServices = Get.find<MyServices>();

    myServices.sharedPreferences.setBool("isLoggedIn", true);
    myServices.sharedPreferences.setString("userType", "doctor");

    Get.offAllNamed(AppRoute.mainScreenDoctorsView);
  }

  @override
  doctorLogin() async {
    var formdata = doctorLoginFormKey.currentState;
    if (formdata!.validate()) {
      // Set statusRequest to loading and update UI
      statusRequest = StatusRequest.loading;
      update();

      // Make the request to the server
      var response = await doctorLoginData.postdata(
        doctorCode.text.trim(),
        doctorPassword.text.trim(),
      );

      print("================================= Controller Response: $response");

      // Handle the response data using the handlingData function
      statusRequest = handlingData(response);
      print("Handling data, status: $statusRequest");

      // Check if the response handling was successful
      if (StatusRequest.success == statusRequest) {
        // Proceed with handling successful response data
        if (response['status'] == 'success') {
          print("Data added: ${response['data']}");
          print("Status : Doctor Login Process is Success");

          // Get the user's name from the response
          String username = response['data']['doctor_name'];

          // Set login status in SharedPreferences
          final myServices = Get.find<MyServices>();
          await myServices.setLoginStatus(true);

          myServices.sharedPreferences
              .setString("id", response['data']['doctor_id'].toString());
          myServices.sharedPreferences
              .setString("username", response['data']['doctor_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['doctor_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['doctor_phone']);
          myServices.sharedPreferences
              .setString("code", response['data']['doctor_code']);
          myServices.sharedPreferences
              .setString("password", doctorPassword.text);

          // Navigate to the home page
          goToMainScreenDoctorViewPage();

          // Show success snackbar
          _snackbarService.showSnackbar(
            message: "Dr : $username",
            mainTitle: "My Project : أهلا بك في تطبيقنا",
            backgroundColor: orangeColor,
          );
        }
        // Handle failure case from the response
        else if (response['status'] == 'failure') {
          _snackbarService.showSnackbar(
            message:
                "كود الدكتور أو كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى",
            mainTitle: "خطأ في تسجيل الدخول",
          );
          statusRequest = StatusRequest.failure;
        } else {
          print("Error: Unknown status or response data.");
          _snackbarService.showSnackbar(
            mainTitle: "فشل تسجيل الدخول",
            message: "يرجى المحاولة مرة أخرى",
          );
          statusRequest = StatusRequest.failure;
        }
      } else {
        print("Error: StatusRequest is not success.");
        // StatusRequest will be handled by HandlingDataRequest widget
      }

      // Update the UI
      update();
    } else {
      print("Status : Student Login Process is Fail");
    }
  }

  @override
  goToMainScreenDoctorViewPage() {
    Get.offAllNamed(AppRoute.mainScreenDoctorsView);
  }
}
