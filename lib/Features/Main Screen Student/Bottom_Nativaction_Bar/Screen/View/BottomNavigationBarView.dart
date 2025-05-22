import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Images/Images.dart';
import '../../../Student Change Screen/Screen/View/Student_Change_Screen_View.dart';
import '../../../Student Chat Screen/Screen/View/Student_Chat_Screen_View.dart';
import '../../../Student Home Screen/Screen/View/Student_Home_Screen_View.dart';
import '../../../Student Setting Screen/Screen/View/Student_Setting_Screen_View.dart';
import '../../../Student Upload Files Screen/Screen/View/Student_Success_Upload_Files_View.dart';
import '../../../Student Upload Files Screen/Screen/View/Student_Upload_Files_View.dart';
import '../../Controller/BottomNavigationBarController.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final BottomNavigationBarController controller = Get.put(BottomNavigationBarController());

    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndex.value,
          children: const <Widget>[
            StudentSettingScreenView(),
            StudentChangeScreenView(),
            StudentHomeScreenView(),
            StudentChatScreenView(),
            StudentSuccessUploadFilesView(),
          ],
        );
      }),
      floatingActionButton: Obx(() {
        if (controller.currentIndex.value == 4) {
          return FloatingActionButton(
            heroTag: "uploadFiles",
            onPressed: () {
              Get.to(() => const StudentUploadFilesView());
            },
            backgroundColor: orangeColor,
            child: const Icon(
              Icons.file_upload_outlined,
              color: blackColor,
            ),
          );
        }
        return const SizedBox();
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: controller.notchBottomBarController,
        color: const Color(0xfff2f2f2),
        showBottomRadius: false,
        showLabel: true,
        textOverflow: TextOverflow.visible,
        maxLine: 1,
        shadowElevation: 5,
        kBottomRadius: 28.0,
        notchColor: const Color(0xfff2f2f2),
        removeMargins: false,
        bottomBarWidth: 500,
        showShadow: false,
        durationInMilliSeconds: 300,
        itemLabelStyle: const TextStyle(fontSize: 10),
        elevation: 0.0,
        kIconSize: 22,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: LocalImage(
              localImagePath: "setting.png",
              widthImage: 0.0001,
              heightImage: 0.001,
              colorImage: blackColor,
            ),
            activeItem: LocalImage(
              localImagePath: "setting.png",
              widthImage: 0.1,
              heightImage: 0.03,
              colorImage: orangeColor,
            ),
            //itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: LocalImage(
              localImagePath: "interaction.png",
              widthImage: 0.0001,
              heightImage: 0.001,
              colorImage: blackColor,
            ),
            activeItem: LocalImage(
              localImagePath: "interaction.png",
              widthImage: 0.1,
              heightImage: 0.03,
              colorImage: orangeColor,
            ),
            //itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: LocalImage(
              localImagePath: "home.png",
              widthImage: 0.0001,
              heightImage: 0.001,
              colorImage: blackColor,
            ),
            activeItem: LocalImage(
              localImagePath: "home.png",
              widthImage: 0.1,
              heightImage: 0.03,
              colorImage: orangeColor,
            ),
            //itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: LocalImage(
              localImagePath: "chat.png",
              widthImage: 0.0001,
              heightImage: 0.001,
              colorImage: blackColor,
            ),
            activeItem: LocalImage(
              localImagePath: "chat.png",
              widthImage: 0.1,
              heightImage: 0.03,
              colorImage: orangeColor,
            ),
            //itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: LocalImage(
              localImagePath: "folder.png",
              widthImage: 0.0001,
              heightImage: 0.001,
              colorImage: blackColor,
            ),
            activeItem: LocalImage(
              localImagePath: "folder.png",
              widthImage: 0.1,
              heightImage: 0.03,
              colorImage: orangeColor,
            ),
            //itemLabel: 'Page 1',
          ),
        ],
        onTap: (index) {
          controller.updateIndex(index); // Update the index in your controller
        },
      ),
    );
  }
}

// class BottomNavigationBarView extends StatefulWidget {
//   const BottomNavigationBarView({super.key});
//
//   @override
//   State<BottomNavigationBarView> createState() =>
//       _BottomNavigationBarViewState();
// }
//
// class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
//   /// Controller to handle PageView and also handles initial page
//   final _pageController = PageController(initialPage: 2);
//
//   /// Controller to handle bottom nav bar and also handles initial page
//   final NotchBottomBarController _controller =
//       NotchBottomBarController(index: 2);
//
//   int maxCount = 5;
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//
//     super.dispose();
//   }
//
//   Future<bool> onWillPop() async {
//     final dialog = ExitApp(context);
//     return await dialog.show();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     /// widget list
//     final List<Widget> bottomBarPages = [
//       const StudentSettingScreenView(),
//       const StudentChangeScreenView(),
//       const StudentHomeScreenView(),
//       const StudentChatScreenView(),
//       const StudentSuccessUploadFilesView(),
//     ];
//     return WillPopScope(
//       onWillPop: onWillPop,
//       child: Scaffold(
//         body: PageView(
//           controller: _pageController,
//           physics: const NeverScrollableScrollPhysics(),
//           children: List.generate(
//               bottomBarPages.length, (index) => bottomBarPages[index]),
//         ),
//         extendBody: true,
//         floatingActionButton: _controller.index == 4
//             ? FloatingActionButton(
//                 heroTag: "uploadFilesFAB",
//                 onPressed: () {
//                   Get.to(const StudentUploadFilesView());
//                 },
//                 backgroundColor: orangeColor,
//                 child: const Icon(
//                   Icons.file_upload_outlined,
//                   color: blackColor,
//                 ),
//               )
//             : null,
//         floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
//         bottomNavigationBar: (bottomBarPages.length <= maxCount)
//             ? AnimatedNotchBottomBar(
//                 /// Provide NotchBottomBarController
//                 notchBottomBarController: _controller,
//                 color: const Color(0xfff2f2f2),
//                 showBottomRadius: false,
//                 showLabel: true,
//                 textOverflow: TextOverflow.visible,
//                 maxLine: 1,
//                 shadowElevation: 5,
//                 kBottomRadius: 28.0,
//                 notchColor: const Color(0xfff2f2f2),
//                 removeMargins: false,
//                 bottomBarWidth: 500,
//                 showShadow: false,
//                 durationInMilliSeconds: 300,
//                 itemLabelStyle: const TextStyle(fontSize: 10),
//                 elevation: 0.0,
//                 bottomBarItems: const [
//                   BottomBarItem(
//                     inActiveItem: LocalImage(
//                       localImagePath: "setting.png",
//                       widthImage: 0.0001,
//                       heightImage: 0.001,
//                       colorImage: blackColor,
//                     ),
//                     activeItem: LocalImage(
//                       localImagePath: "setting.png",
//                       widthImage: 0.1,
//                       heightImage: 0.03,
//                       colorImage: orangeColor,
//                     ),
//                     //itemLabel: 'Page 1',
//                   ),
//                   BottomBarItem(
//                     inActiveItem: LocalImage(
//                       localImagePath: "interaction.png",
//                       widthImage: 0.0001,
//                       heightImage: 0.001,
//                       colorImage: blackColor,
//                     ),
//                     activeItem: LocalImage(
//                       localImagePath: "interaction.png",
//                       widthImage: 0.1,
//                       heightImage: 0.03,
//                       colorImage: orangeColor,
//                     ),
//                     //itemLabel: 'Page 1',
//                   ),
//                   BottomBarItem(
//                     inActiveItem: LocalImage(
//                       localImagePath: "home.png",
//                       widthImage: 0.0001,
//                       heightImage: 0.001,
//                       colorImage: blackColor,
//                     ),
//                     activeItem: LocalImage(
//                       localImagePath: "home.png",
//                       widthImage: 0.1,
//                       heightImage: 0.03,
//                       colorImage: orangeColor,
//                     ),
//                     //itemLabel: 'Page 1',
//                   ),
//                   BottomBarItem(
//                     inActiveItem: LocalImage(
//                       localImagePath: "chat.png",
//                       widthImage: 0.0001,
//                       heightImage: 0.001,
//                       colorImage: blackColor,
//                     ),
//                     activeItem: LocalImage(
//                       localImagePath: "chat.png",
//                       widthImage: 0.1,
//                       heightImage: 0.03,
//                       colorImage: orangeColor,
//                     ),
//                     //itemLabel: 'Page 1',
//                   ),
//                   BottomBarItem(
//                     inActiveItem: LocalImage(
//                       localImagePath: "folder.png",
//                       widthImage: 0.0001,
//                       heightImage: 0.001,
//                       colorImage: blackColor,
//                     ),
//                     activeItem: LocalImage(
//                       localImagePath: "folder.png",
//                       widthImage: 0.1,
//                       heightImage: 0.03,
//                       colorImage: orangeColor,
//                     ),
//                     //itemLabel: 'Page 1',
//                   ),
//                 ],
//                 onTap: (index) {
//                   setState(() {
//                     _controller.index = index; // Update the current index
//                   });
//                   log('current selected index $index');
//                   _pageController.jumpToPage(index);
//                 },
//                 kIconSize: 24.0,
//               )
//             : null,
//       ),
//     );
//   }
// }
//
