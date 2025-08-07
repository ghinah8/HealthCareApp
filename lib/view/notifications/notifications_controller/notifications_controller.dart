// controllers/notification_controller.dart
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final notifications = <String, List<Map<String, String>>>{
    "Today": [
      {
        "title": "Scheduled Appointment",
        "desc": "Lorem ipsum dolor sit amet...",
        "time": "2h",
      },
      {
        "title": "Scheduled Change",
        "desc": "Lorem ipsum dolor sit amet...",
        "time": "2h",
      },
    ],
    "Yesterday": [
      {
        "title": "Scheduled Appointment",
        "desc": "Lorem ipsum dolor sit amet...",
        "time": "1d",
      },
    ],
    "15 April": [
      {
        "title": "Medical History Update",
        "desc": "Lorem ipsum dolor sit amet...",
        "time": "5d",
      },
    ],
  }.obs;

  bool get isEmpty => notifications.values.every((list) => list.isEmpty);
}
