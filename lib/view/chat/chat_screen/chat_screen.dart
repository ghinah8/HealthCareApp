import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const_data/app_colors.dart';
import 'package:healthcare/core/const_data/app_image.dart';
import 'package:healthcare/core/const_data/text_style.dart';
import 'package:healthcare/media_query_service.dart';
import 'package:healthcare/view/chat/chat_controller/chat_controller.dart';
import 'package:healthcare/widget/general_widget/back_button.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Mycolor.white,
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        toolbarHeight: 100,
        leading: Backbutton(),
        title: Row(
          children: [
            Image.asset(AppImage.ai),
            const SizedBox(width: 10),
            Text('Dr.Ai', style: FontStyles.drai),
          ],
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            chatController.messages.isEmpty
                ? Expanded(
                    child: Center(
                      child: Text(
                        'Where should we begin?',
                        style: FontStyles.drai,
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: chatController.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatController.messages[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: BubbleSpecialThree(
                          text: message['text'],
                          isSender: message['isSender'],
                          color: message['isSender']
                              ? Mycolor.lightblue.withAlpha(135)
                              : Mycolor.bublechatrecivecolor,
                          tail: true,
                          textStyle: FontStyles.mymessage,
                        ),
                      );
                    },
                  )),
            MessageBar(
              onSend: (text) {
                chatController.sendMessage(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
