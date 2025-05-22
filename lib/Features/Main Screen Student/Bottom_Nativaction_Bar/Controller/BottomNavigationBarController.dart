import 'package:get/get.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class BottomNavigationBarController extends GetxController {
  // Observable for the current index of the bottom navigation bar
  var currentIndex = 2.obs;

  // Controller for managing the notch bottom bar
  final NotchBottomBarController notchBottomBarController = NotchBottomBarController(index: 2);

  @override
  void onInit() {
    super.onInit();
    // If needed, set the initial index or perform setup here
    notchBottomBarController.index = currentIndex.value;
  }

  // Method to update the index
  void updateIndex(int index) {
    currentIndex.value = index;
    notchBottomBarController.index = index;
  }
}
