import 'package:get/get.dart';
import 'Model/Crud/Crud_Model.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}