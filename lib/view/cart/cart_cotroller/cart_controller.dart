import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController {
  List<CartItem> cartItems = [];
  void addItem(String name, String image, double price, int quantity) {
    int index = cartItems.indexWhere((item) => item.name == name);
    if (index != -1) {
      cartItems[index].quantity += quantity;
    } else {
      cartItems.add(
          CartItem(name: name, image: image, price: price, quantity: quantity));
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
}

class CartItem {
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  double get total => price * quantity;
}
