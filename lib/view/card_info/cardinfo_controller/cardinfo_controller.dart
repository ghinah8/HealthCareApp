import 'package:get/get.dart';

class CardinfoController extends GetxController {
  RxBool checkboxstate = false.obs;
  void toggleCheckbox(bool? value) {
    checkboxstate.value = value!;
    update();
  }
}
