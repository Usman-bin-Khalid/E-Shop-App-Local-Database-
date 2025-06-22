// import 'package:flutter/cupertino.dart';
// class ProductModelClass {
//   final String image;
//   final String title;
//   final String? description;
//   final int price;
//   final IconData? favourite;
//   final int? quantity;
//   final int id;
//
//   ProductModelClass(
//       {required this.image,
//         this.quantity,
//       required this.title,
//         this.description,
//         this.favourite,
//         required this.id,
//       required this.price});
//
//
// }
//
//
import 'package:flutter/cupertino.dart';

class ProductModelClass {
  late final String image;
  late final String title;
  late final String? description;
  late final int price;
  final IconData? favourite;
  late final int? quantity;
  final int id;

  ProductModelClass({
    required this.image,
    this.quantity,
    required this.title,
    this.description,
    this.favourite,
    required this.id,
    required this.price,
  });

  /// Convert a ProductModelClass instance to a JSON-compatible Map
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'price': price,
      'favourite': favourite != null ? favourite?.codePoint : null,
      'quantity': quantity,
      'id': id,
    };
  }

  /// Create a ProductModelClass instance from a JSON-compatible Map
  factory ProductModelClass.fromJson(Map<String, dynamic> json) {
    return ProductModelClass(
      image: json['image'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      favourite: json['favourite'] != null
          ? IconData(json['favourite'], fontFamily: 'MaterialIcons')
          : null,
      quantity: json['quantity'],
      id: json['id'],
    );
  }
}
