import 'package:get/get.dart';

class MedicinedetailsController extends GetxController {
  int number = 1;
  double price = 99.9;
  double sum = 99.9;
  inc() {
    number++;
    sum += price;
    update();
  }

  dec() {
    if (number > 1) {
      number--;
      sum -= price;
      update();
    }
  }
}
