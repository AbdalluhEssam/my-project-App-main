import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Status Request/Status_Request_model.dart';

class NetworkController extends GetxController {
  var statusRequest = StatusRequest.loading.obs;

  @override
  void onInit() {
    super.onInit();
    _monitorNetworkStatus();
  }

  void _monitorNetworkStatus() async {
    // Check internet connection every few seconds
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      await _checkInternetConnection();
    });
  }

  Future<void> _checkInternetConnection() async {
    try {
      // Attempt to ping a server (Google, in this case)
      final response = await http.get(Uri.parse('https://www.google.com'));
      if (response.statusCode == 200) {
        statusRequest.value = StatusRequest.success; // Connected
      } else {
        statusRequest.value = StatusRequest.serverfailure; // Server error
      }
    } catch (e) {
      // If there's an error (like no internet), set status to offline
      print("Network Error is : $e");
      statusRequest.value = StatusRequest.offlinefailure;
    }
  }
}