class CreateMedicineOrder {
  List<ProductList> productList;
  String address;
  String startHour;
  String endHour;

  CreateMedicineOrder({
    required this.productList,
    required this.address,
    required this.startHour,
    required this.endHour,
  });

  // دالة تحويل إلى JSON جاهزة للإرسال
  Map<String, dynamic> toJson() {
    return {
      "productList": productList.map((e) => e.toJson()).toList(),
      "address": address,
      "startHour": startHour,
      "endHour": endHour,
    };
  }
}

class ProductList {
  String productId;
  int quantity;

  ProductList({
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "quantity": quantity,
    };
  }
}
