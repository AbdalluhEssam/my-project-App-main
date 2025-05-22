import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/SnackBar/Snack_bar.dart';
import '../../../Model/App Routes/App_Route_Model.dart';
import '../../../Model/Handling Data/Handling_Data_Model.dart';
import '../../../Model/My Services/My_Services_Model.dart';
import '../../../Model/Status Request/Status_Request_model.dart';
import '../../../core/Constant/Validator/Validators.dart';
import '../data/Student_Login_Data.dart';

abstract class StudentLoginController extends GetxController {
  studentLogin();

  goToBottomNavigationBarPage();
}

class StudentLoginControllerImp extends StudentLoginController {
  final SnackbarService _snackbarService = SnackbarService();
  GlobalKey<FormState> studentLoginFormKey = GlobalKey<FormState>();
  late TextEditingController studentCode;
  late TextEditingController studentPassword;
  StudentLoginData studentLoginData = StudentLoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List data = [];
  String? stdName;
  String? stdCode;

  var studentCodeValid = false.obs;
  var studentPasswordValid = false.obs;

  @override
  void onInit() {
    studentCode = TextEditingController();
    studentPassword = TextEditingController();
    stdName = myServices.sharedPreferences.getString("username");
    stdCode = myServices.sharedPreferences.getString("code");
    super.onInit();
  }

  @override
  void dispose() {
    studentCode.dispose();
    studentPassword.dispose();
    super.dispose();
  }

  void validateEmail() {
    String? errorMessage = validatorInput(studentCode.text, "code");
    studentCodeValid.value = errorMessage == null;
  }

  void validatePassword() {
    String? errorMessage = validatorInput(studentPassword.text, "pass");
    studentPasswordValid.value = errorMessage == null;
  }

  void loginStudentSuccess() {
    final myServices = Get.find<MyServices>();

    myServices.sharedPreferences.setBool("isLoggedIn", true);
    myServices.sharedPreferences.setString("userType", "student");

    Get.offAllNamed(AppRoute.bottomNativactionBarView);
  }

  @override
  studentLogin() async {
    var formdata = studentLoginFormKey.currentState;
    if (formdata!.validate()) {
      // Set statusRequest to loading and update UI
      statusRequest = StatusRequest.loading;
      update();

      // Make the request to the server
      var response = await studentLoginData.postdata(
        studentCode.text.trim(),
        studentPassword.text.trim(),
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
          print("Status : Student Login Process is Success");

          // Get the user's name from the response
          String username = response['data']['student_name'];

          // Set login status in SharedPreferences
          final myServices = Get.find<MyServices>();
          await myServices.setLoginStatus(true);

          myServices.sharedPreferences
              .setString("id", response['data']['student_id'].toString());
          myServices.sharedPreferences
              .setString("username", response['data']['student_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['student_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['student_phone']);
          myServices.sharedPreferences
              .setString("department", response['data']['student_department']);
          myServices.sharedPreferences
              .setString("code", response['data']['student_code']);
          myServices.sharedPreferences
              .setString("password", studentPassword.text);

          // Navigate to the home page
          goToBottomNavigationBarPage();

          // Show success snackbar
          _snackbarService.showSnackbar(
            message: "Std : $username",
            mainTitle: "My Project : أهلا بك في تطبيقنا",
            backgroundColor: orangeColor,
          );
        }
        // Handle failure case from the response
        else if (response['status'] == 'failure') {
          _snackbarService.showSnackbar(
            message:
                "كود الطالب أو كلمة المرور غير صحيحة. يرجى المحاولة مرة أخرى",
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
  goToBottomNavigationBarPage() {
    Get.offAllNamed(AppRoute.bottomNativactionBarView);
  }
}
