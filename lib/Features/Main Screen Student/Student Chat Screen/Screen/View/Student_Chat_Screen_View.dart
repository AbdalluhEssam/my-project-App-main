import 'package:chat_text_package/chat/presentation/screens/chat_screen.dart';
import 'package:chat_text_package/core/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/Constant/Colors/Colors.dart';
import 'package:my_project/core/Constant/Fonts/Fonts.dart';

class StudentChatScreenView extends StatefulWidget {
  const StudentChatScreenView({super.key});

  @override
  State<StudentChatScreenView> createState() => _StudentChatScreenViewState();
}

class _StudentChatScreenViewState extends State<StudentChatScreenView> {
  ScrollController scrollController = ScrollController();

  List<Message> messageList = [
    Message(
        id: 1,
        body: 'messsage',
        fromLoggedUser: false,
        createdAt: '2024-12-11 03:45 PM'),
    Message(
        id: 2,
        body: 'messsage',
        fromLoggedUser: true,
        createdAt: '2024-12-11 03:45 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: Get.height * 0.08,
            // ),
            Container(
              height: Get.height * 1,
              //color: Colors.red,
              child: ChatScreen(
                  messages: messageList,
                  scrollController: scrollController,
                  otherUserName: 'Mohamed Abd El.Gwad',
                  textHint: 'Enter your message',
                  otherUserImage:
                      'https://www.euroschoolindia.com/wp-content/uploads/2023/08/cartoons-for-kids.jpg',
                  activeSendIconColor: orangeColor,
                  chatAppBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  myMessageBackGrounColor: orangeColor,
                  otherMessageBackGrounColor: blackColor,
                  userNameStyle: smallBlackColor,
                  onSubmitMessage: (String msg) {
                    messageList.insert(
                        0,
                        Message(
                            id: 1,
                            body: msg,
                            fromLoggedUser: true,
                            createdAt: '2024-12-11 03:45 PM'));
                    setState(() {});
                  }),
            )
          ],
        ),
      ),
    );
  }
}
