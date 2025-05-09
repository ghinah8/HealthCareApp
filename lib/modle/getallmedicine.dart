// To parse this JSON data, do
//
//     final productmoudel = productmoudelFromJson(jsonString);

import 'dart:convert';

Productmoudel productmoudelFromJson(String str) =>
    Productmoudel.fromJson(json.decode(str));

String productmoudelToJson(Productmoudel data) => json.encode(data.toJson());

class Productmoudel {
  final List<Product> products;
  final int totalCount;
  final int documentCount;

  Productmoudel({
    required this.products,
    required this.totalCount,
    required this.documentCount,
  });

  factory Productmoudel.fromJson(Map<String, dynamic> json) => Productmoudel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        totalCount: json["totalCount"],
        documentCount: json["documentCount"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "totalCount": totalCount,
        "documentCount": documentCount,
      };
}

class Product {
  final String id;
  final String image;
  final String name;
  final Pharmacy? pharmacy;
  final double price;
  final double oldPrice;
  final String description;
  final String capacity;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String productId;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.pharmacy,
    required this.price,
    required this.oldPrice,
    required this.description,
    required this.capacity,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.productId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        image: json["image"],
        name: json["name"],
        pharmacy: json["pharmacy"] == null
            ? null
            : Pharmacy.fromJson(json["pharmacy"]),
        price: json["price"]?.toDouble(),
        oldPrice: json["oldPrice"]?.toDouble(),
        description: json["description"],
        capacity: json["capacity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        productId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "name": name,
        "pharmacy": pharmacy?.toJson(),
        "price": price,
        "oldPrice": oldPrice,
        "description": description,
        "capacity": capacity,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": productId,
      };
}

class Pharmacy {
  final String id;
  final String image;
  final String name;
  final String description;
  final String phoneNumber;
  final String location;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String pharmacyId;

  Pharmacy({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.phoneNumber,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.pharmacyId,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
        id: json["_id"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        phoneNumber: json["phoneNumber"],
        location: json["location"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        pharmacyId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "name": name,
        "description": description,
        "phoneNumber": phoneNumber,
        "location": location,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": pharmacyId,
      };
}
