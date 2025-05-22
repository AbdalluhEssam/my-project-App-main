import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    // await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  bool isLoggedIn() {
    // Check the login status from SharedPreferences
    return sharedPreferences.getBool("isLoggedIn") ?? false;
  }

  Future<void> setLoginStatus(bool status) async {
    // Store the login status in SharedPreferences
    await sharedPreferences.setBool("isLoggedIn", status);
  }

  bool isSignedUp() {
    // Check if the user is signed up
    return sharedPreferences.getBool("isSignedUp") ?? false;
  }

  Future<void> setSignUpStatus(bool status) async {
    // Store the sign-up status in SharedPreferences
    await sharedPreferences.setBool("isSignedUp", status);
  }
}