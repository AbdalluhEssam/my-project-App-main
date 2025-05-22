import 'package:get/get.dart';
import '../../../Model/App Routes/App_Route_Model.dart';
import '../../../Model/My Services/My_Services_Model.dart';

class OnboardingController extends GetxController {
  final MyServices myServices = Get.find();

  void onSkip() async {
    // Set the onboarding flag in SharedPreferences
    await myServices.sharedPreferences.setString("onboarding", "1");

    // Navigate to the Choose Department screen
    Get.offAllNamed(AppRoute.chooseDepartment);
  }
}