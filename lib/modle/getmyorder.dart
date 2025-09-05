class GetmyOrder {
  List<Order> orders;

  GetmyOrder({
    required this.orders,
  });
}

class Order {
  String id;
  User user;
  String startHour;
  String endHour;
  Ambulance? ambulance;
  Status status;
  double price;
  String address;
  List<ProductList> productList;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String orderId;
  User? doctor;

  Order({
    required this.id,
    required this.user,
    required this.startHour,
    required this.endHour,
    this.ambulance,
    required this.status,
    required this.price,
    required this.address,
    required this.productList,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.orderId,
    this.doctor,
  });
}

class Ambulance {
  String id;
  String name;
  double price;
  Id? ambulanceId;

  Ambulance({
    required this.id,
    required this.name,
    required this.price,
    this.ambulanceId,
  });
}

enum Id {
  THE_681_DE82_D530493_D8_EF8_E41_D0,
  THE_681_DE892530493_D8_EF8_E41_D4,
  THE_681_DE8_DC530493_D8_EF8_E41_D6
}

class User {
  String id;
  String username;
  String email;
  int? pricePerHour;
  String userId;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.pricePerHour,
    required this.userId,
  });
}

class ProductList {
  Ambulance productId;
  int quantity;
  String id;
  String productListId;

  ProductList({
    required this.productId,
    required this.quantity,
    required this.id,
    required this.productListId,
  });
}

enum Status { ACCEPTED, PENDING }
