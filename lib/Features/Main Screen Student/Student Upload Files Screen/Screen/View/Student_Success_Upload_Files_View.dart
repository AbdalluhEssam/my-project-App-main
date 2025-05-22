import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/Constant/Buttons/Buttons.dart';
import '../Widget/Student_Success_Upload_File_Widget.dart';

class StudentSuccessUploadFilesView extends StatefulWidget {
  const StudentSuccessUploadFilesView({super.key});

  @override
  State<StudentSuccessUploadFilesView> createState() => _StudentSuccessUploadFilesViewState();
}

class _StudentSuccessUploadFilesViewState extends State<StudentSuccessUploadFilesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
          print("Floating Action Button Pressed");
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.orange, // Customize the color if needed
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.08,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SecondButton(nameButton: "الملفات المرسلة")],
            ),
            StudentSuccessUploadFileWidget(
              nameFile: "First Project For Test",
              kindFile: "PNG",
              summitDate: "10/10/2024",
              onClickButton: () {},
            ),
            StudentSuccessUploadFileWidget(
              nameFile: "First Project For Test",
              kindFile: "PNG",
              summitDate: "10/10/2024",
              onClickButton: () {},
            ),
            StudentSuccessUploadFileWidget(
              nameFile: "First Project For Test",
              kindFile: "PNG",
              summitDate: "10/10/2024",
              onClickButton: () {},
            ),
            StudentSuccessUploadFileWidget(
              nameFile: "First Project For Test",
              kindFile: "PNG",
              summitDate: "10/10/2024",
              onClickButton: () {},
            ),
            StudentSuccessUploadFileWidget(
              nameFile: "First Project For Test",
              kindFile: "PNG",
              summitDate: "10/10/2024",
              onClickButton: () {},
            ),
            StudentSuccessUploadFileWidget(
              nameFile: "First Project For Test",
              kindFile: "PNG",
              summitDate: "10/10/2024",
              onClickButton: () {},
            ),
            SizedBox(
              height: Get.height * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}
