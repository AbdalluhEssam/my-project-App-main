import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Colors/Colors.dart';

class ExitApp {
  final BuildContext context;

  ExitApp(this.context);

  Future<bool> show() async {
    // Show an AlertDialog when the back button is pressed
    bool? shouldExit = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1
            )
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title:  Text(
            "هل تريد الخروج من التطبيق ؟",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 18, color: Theme.of(context).primaryColor), // Adjusted style
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Container(
                  width: Get.width * 0.2,
                  height: Get.height * 0.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(color: orangeColor, width: 1.5)),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "لا",
                        style: TextStyle(
                            fontSize: 16, color: Theme.of(context).primaryColor), // Adjusted style
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                // onPressed: () => exit(0),
                onTap: () {
                  if (Platform.isAndroid) {
                    // Close the app and remove it from memory
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  } else if (Platform.isIOS) {
                    // On iOS, we can only exit the app
                    exit(0);
                  }
                },
                child: Container(
                  width: Get.width * 0.2,
                  height: Get.height * 0.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(color: orangeColor, width: 1.5)),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "نعم",
                        style: TextStyle(
                            fontSize: 16, color: Theme.of(context).primaryColor), // Adjusted style
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    // If the user confirms, exit the app
    if (shouldExit == true) {
      return true; // Allow the app to close
    } else {
      return false; // Prevent the app from closing
    }
  }
}
