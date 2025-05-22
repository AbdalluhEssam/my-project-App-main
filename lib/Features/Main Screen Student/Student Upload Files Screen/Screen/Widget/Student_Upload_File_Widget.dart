import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Buttons/Buttons.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../core/Constant/Colors/Colors.dart';
import '../../../../../core/Constant/Images/Images.dart';

class StudentUploadFileWidget extends StatefulWidget {
  const StudentUploadFileWidget({super.key});

  @override
  State<StudentUploadFileWidget> createState() =>
      _StudentUploadFileWidgetState();
}

class _StudentUploadFileWidgetState extends State<StudentUploadFileWidget> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;

  Future<void> requestFilePickerPermission() async {
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      print("إذن الوصول إلى التخزين مُمنوح");
    } else if (status.isDenied) {
      print("تم رفض إذن الوصول إلى التخزين");
    } else if (status.isPermanentlyDenied) {
      print("تم رفض إذن الوصول إلى التخزين بشكل دائم");
      openAppSettings(); // توجيه المستخدم لتمكين الإذن يدوياً
    }
  }

  void pickFile() async {
    try {
      // Request permission before trying to pick the file
      await requestFilePickerPermission();

      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png'], // Add required extensions
        allowMultiple: false,
      );

      if (result != null && result!.files.isNotEmpty) {
        pickedFile = result!.files.first;

        if (pickedFile!.path != null) {
          _fileName = pickedFile!.name;
          print("File Name: $_fileName");

          setState(() {
            fileToDisplay = File(pickedFile!.path!);
          });
        } else {
          print("Error: Path is null");
        }
      } else {
        print("Error: No file selected");
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("حدث خطأ أثناء اختيار الملف: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void resetFile() {
    setState(() {
      fileToDisplay = null;
      _fileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (fileToDisplay == null)
          Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.orange,
                  )
                : GestureDetector(
                    onTap: () {
                      pickFile();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:  Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Icon(
                            Icons.file_upload_outlined,
                            size: 100,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "أضغط لتسليم الملف",
                            style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        if (fileToDisplay != null) // Show preview of the selected file
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            resetFile(); // Reset file selection when closing
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
                // Show content based on file type
                if (_fileName != null && _fileName!.endsWith('.pdf'))
                  Icon(
                    Icons.picture_as_pdf,
                    size: 100,
                    color: Colors.red,
                  )
                else if (_fileName != null &&
                    (_fileName!.endsWith('.png') ||
                        _fileName!.endsWith('.jpg')))
                  Image.file(
                    fileToDisplay!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                else
                  Text("نوع الملف غير مدعوم",
                      style: TextStyle(color: Colors.red)),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    _fileName ?? 'No File Name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                MainButton(
                  nameButton: "حفظ",
                  onClickButton: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1
                              )
                            ),
                            title: const LocalImage(
                              localImagePath: "success.png",
                              widthImage: 0.25,
                              heightImage: 0.1,
                              colorImage: orangeColor,
                            ),
                            content: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                    textAlign: TextAlign.center,
                                    style: verySmallBlackColor,
                                    "تم التسليم")),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 30),
                                        child: Container(
                                          width: Get.width * 0.45,
                                          decoration: BoxDecoration(
                                            color: orangeColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "تم",
                                                style: bigWhiteColor,
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
