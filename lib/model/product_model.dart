// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  num id;
  String title;
  String description;
  num price;
  num rating;
  String brand;
  String category;
  String thumbnail;
  List images;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  ProductModel copyWith({
    num? id,
    String? title,
    String? description,
    num? price,
    num? rating,
    String? brand,
    String? category,
    String? thumbnail,
    List? images,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'rating': rating,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as num,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
      rating: map['rating'] as num,
      brand: map['brand'] as String,
      category: map['category'] as String,
      thumbnail: map['thumbnail'] as String,
      images: List.from(
        (map['images'] as List),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, description: $description, price: $price, rating: $rating, brand: $brand, category: $category, thumbnail: $thumbnail, images: $images)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.rating == rating &&
        other.brand == brand &&
        other.category == category &&
        other.thumbnail == thumbnail &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        brand.hashCode ^
        category.hashCode ^
        thumbnail.hashCode ^
        images.hashCode;
  }
}
