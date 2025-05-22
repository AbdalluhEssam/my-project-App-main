import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/Constant/Buttons/Buttons.dart';
import '../../core/Constant/Fonts/Fonts.dart';
import '../../core/Constant/Images/Images.dart';
import '../Status Request/Status_Request_model.dart';
import 'Network_Model.dart';

class HandlingDataStatus extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataStatus(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: LottieImage(lottieImagePath: "loading.json"))
        : statusRequest == StatusRequest.offlinefailure
            ? const LottieImage(lottieImagePath: "Animation - 1725896537245.json")
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Text(
                    "Server Failure",
                    style: bigWhiteColor,
                  ))
                : statusRequest == StatusRequest.failure
                    ? const Center(
                        child: Text(
                        "No Data",
                        style: bigWhiteColor,
                      ))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final Widget widget;
  final NetworkController networkController = Get.put(NetworkController());

  HandlingDataRequest({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      StatusRequest statusRequest = networkController.statusRequest.value;

      if (statusRequest == StatusRequest.loading) {
        // Show loading animation while checking the connection
        return const Center(
          child: LottieImage(lottieImagePath: "loading.json"),
        );
      } else if (statusRequest == StatusRequest.offlinefailure) {
        // No internet connection, show WiFi error animation
        return  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LottieImage(lottieImagePath: "wifi_Error.json"),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  "... شبكتك غير مستقرة. يرجى الانتظار",
                  style: verySmallWhiteColor,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MainButton(
                nameButton: "اعادة المحاولة",
                onClickButton: () {
                  networkController.statusRequest.value;
                },
              ),
            ],
          ),
        );
      } else if (statusRequest == StatusRequest.serverfailure) {
        // Server failure, show error message
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LocalImage(
                  localImagePath: "Oops! 404 Error.gif",
                  widthImage: 0.8,
                  heightImage: 0.35),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  "... يرجى الانتظار قليلاٍ ثم المحاولة مرة أخرى",
                  style: verySmallWhiteColor,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      } else {
        // If everything is fine, show the actual content
        return widget;
      }
    });
  }
}
