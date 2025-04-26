import 'package:get/get.dart';

class MedicinedetailsController extends GetxController {
  int number = 1;
  late double price;
  late double sum;

  MedicinedetailsController({required double initialPrice}) {
    price = initialPrice;
    sum = price;
  }

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
