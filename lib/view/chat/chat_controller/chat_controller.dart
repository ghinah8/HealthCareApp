import 'dart:convert';
import 'package:get/get.dart';
import 'package:healthcare/service/link.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  var messages = <Map<String, dynamic>>[].obs;
  var isTyping = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    messages.add({'text': text, 'isSender': true});
    isTyping.value = true;

    // نضيف "..." بابل مبدئية
    messages.add({'text': '••••', 'isSender': false, 'isTyping': true});

    try {
      final response = await http.post(
        Uri.parse(AppLink.treatment),
        headers: AppLink.getHeader(),
        body: jsonEncode({
          "illness": text,
          "chatId": "6827a4278bbe9f7032ac4c5d",
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data['treatment'];

        //  "..."
        messages.removeWhere((m) => m['isTyping'] == true);

        messages.add({'text': reply, 'isSender': false});
      } else {
        messages.removeWhere((m) => m['isTyping'] == true);
        messages.add({
          'text': 'خطأ ${response.statusCode}: فشل في المعالجة.',
          'isSender': false,
        });
      }
    } catch (e) {
      messages.removeWhere((m) => m['isTyping'] == true);
      messages.add({
        'text': 'تعذر الاتصال بالخادم: $e',
        'isSender': false,
      });
    } finally {
      isTyping.value = false;
    }
  }
}
