// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:nexamart/models/rating.dart';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  String? id;
  String? userId;
  final List<Rating>? rating;

  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    this.userId,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'userId': userId,
      'rating': rating?.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: (map['quantity'] as num).toDouble(), // Cast to double
      images: List<String>.from(map['images'] as List<dynamic>),
      category: map['category'] as String,
      price: (map['price'] as num).toDouble(), // Cast to double
      id: map['_id'] != null ? map['_id'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map((x) => Rating.fromMap(x)),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  Product copyWith({
    String? name,
    String? description,
    double? quantity,
    List<String>? images,
    String? category,
    double? price,
    String? id,
    String? userId,
    List<Rating>? rating,
  }) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      category: category ?? this.category,
      price: price ?? this.price,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      rating: rating ?? this.rating,
    );
  }
}
