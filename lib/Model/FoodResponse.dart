// To parse this JSON data, do
//
//     final foodProduct = foodProductFromJson(jsonString);

import 'dart:convert';

FoodProduct foodProductFromJson(String str) => FoodProduct.fromJson(json.decode(str));

String foodProductToJson(FoodProduct data) => json.encode(data.toJson());

class FoodProduct {
  String type;
  List<Product> products;
  int offset;
  int number;
  int totalProducts;
  int processingTimeMs;
  int expires;
  bool isStale;

  FoodProduct({
    required this.type,
    required this.products,
    required this.offset,
    required this.number,
    required this.totalProducts,
    required this.processingTimeMs,
    required this.expires,
    required this.isStale,
  });

  factory FoodProduct.fromJson(Map<String, dynamic> json) => FoodProduct(
    type: json["type"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    offset: json["offset"],
    number: json["number"],
    totalProducts: json["totalProducts"],
    processingTimeMs: json["processingTimeMs"],
    expires: json["expires"],
    isStale: json["isStale"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "offset": offset,
    "number": number,
    "totalProducts": totalProducts,
    "processingTimeMs": processingTimeMs,
    "expires": expires,
    "isStale": isStale,
  };
}

class Product {
  String image;
  int id;
  String title;
  String imageType;

  Product({
    required this.image,
    required  this.id,
    required this.title,
    required this.imageType,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    image: json["image"],
    id: json["id"],
    title: json["title"],
    imageType: json["imageType"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "id": id,
    "title": title,
    "imageType": imageType,
  };
}
