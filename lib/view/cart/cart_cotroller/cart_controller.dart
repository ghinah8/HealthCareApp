import 'dart:convert';
import 'package:get/get.dart';
import 'package:healthcare/modle/createMeicineOrder.dart';
import 'package:healthcare/service/link.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  RxBool isLoading = false.obs;
  List<CartItem> cartItems = [];

  void addItem(
      String id, String name, String image, double price, int quantity) {
    int index = cartItems.indexWhere((item) => item.name == name);
    if (index != -1) {
      cartItems[index].quantity += quantity;
    } else {
      cartItems.add(CartItem(
        id: id,
        name: name,
        image: image,
        price: price,
        quantity: quantity,
      ));
    }
    update();
  }

  void removeItem(String name) {
    cartItems.removeWhere((item) => item.name == name);
    update();
  }

  void inc(String name) {
    final item = cartItems.firstWhere((e) => e.name == name);
    item.quantity++;
    update();
  }

  void dec(String name) {
    final item = cartItems.firstWhere((e) => e.name == name);
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      cartItems.remove(item);
    }
    update();
  }

  double get totalSum => cartItems.fold(0, (sum, item) => sum + item.total);

  Future<void> createMedicineOrder(CreateMedicineOrder order) async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse(AppLink.createOrder),
        headers: {
          "Content-Type": "application/json",
          ...AppLink.getHeader(),
        },
        body: jsonEncode(order.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success",
            "your order is on progress,it will arrive soon in your address : ${order.address}");
      } else {
        Get.snackbar("Error", "Failed: ${response.statusCode} ");
        print(response.body);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

class CartItem {
  final String name;
  final String image;
  final double price;
  int quantity;
  final String id;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  double get total => price * quantity;
}
