// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetClothesByCategoryModel {
  final int id;
  final int price;
  final int cost;
  final String name;
  final String image;
  final String season;
  final String gender;
  final String description;
  final String size;
  final List<Comment> comment;

  GetClothesByCategoryModel({
    required this.id,
    required this.price,
    required this.cost,
    required this.name,
    required this.image,
    required this.season,
    required this.gender,
    required this.description,
    required this.size,
    required this.comment,
  });

  GetClothesByCategoryModel copyWith({
    int? id,
    int? price,
    int? cost,
    String? name,
    String? image,
    String? season,
    String? gender,
    String? description,
    String? size,
    List<Comment>? comment,
    Map<Category, dynamic>? category,
  }) {
    return GetClothesByCategoryModel(
      id: id ?? this.id,
      price: price ?? this.price,
      cost: cost ?? this.cost,
      name: name ?? this.name,
      image: image ?? this.image,
      season: season ?? this.season,
      gender: gender ?? this.gender,
      description: description ?? this.description,
      size: size ?? this.size,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'cost': cost,
      'name': name,
      'image': image,
      'season': season,
      'gender': gender,
      'description': description,
      'size': size,
    };
  }

  factory GetClothesByCategoryModel.fromMap(Map<String, dynamic> map) {
    return GetClothesByCategoryModel(
      id: map['id'] as int,
      price: map['price'] as int,
      cost: map['cost'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      season: map['season'] as String,
      gender: map['gender'] as String,
      description: map['description'] as String,
      size: map['size'] as String,
      comment: List<Comment>.from(
        (map['comment'] as List<dynamic>).map<Comment>(
          (x) => Comment.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetClothesByCategoryModel.fromJson(String source) =>
      GetClothesByCategoryModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetClothesByCategoryModel(id: $id, price: $price, cost: $cost, name: $name, image: $image, season: $season, gender: $gender, description: $description, size: $size, comment: $comment, )';
  }

  @override
  bool operator ==(covariant GetClothesByCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.price == price &&
        other.cost == cost &&
        other.name == name &&
        other.image == image &&
        other.season == season &&
        other.gender == gender &&
        other.description == description &&
        other.size == size &&
        listEquals(other.comment, comment);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        price.hashCode ^
        cost.hashCode ^
        name.hashCode ^
        image.hashCode ^
        season.hashCode ^
        gender.hashCode ^
        description.hashCode ^
        size.hashCode ^
        comment.hashCode;
  }
}

class Comment {
  final int id;
  final String customer_name;
  final String description;
  Comment({
    required this.id,
    required this.customer_name,
    required this.description,
  });

  Comment copyWith({
    int? id,
    String? customer_name,
    String? description,
  }) {
    return Comment(
      id: id ?? this.id,
      customer_name: customer_name ?? this.customer_name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customer_name': customer_name,
      'description': description,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] as int,
      customer_name: map['customer_name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Comment(id: $id, customer_name: $customer_name, description: $description)';

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.customer_name == customer_name &&
        other.description == description;
  }

  @override
  int get hashCode =>
      id.hashCode ^ customer_name.hashCode ^ description.hashCode;
}

class Category {
  final int id;
  final String name;
  Category({
    required this.id,
    required this.name,
  });

  Category copyWith({
    int? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(id: $id, name: $name)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
