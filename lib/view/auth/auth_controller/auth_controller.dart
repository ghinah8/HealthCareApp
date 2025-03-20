import 'package:get/get.dart';

class AuthController extends GetxController {
  bool recovery = true;

  void isrcover() {
    recovery = !recovery;
    update();
  }
}
