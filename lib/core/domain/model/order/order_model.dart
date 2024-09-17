// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fashion_app/core/domain/model/clothes/get_clothes_by_category.dart';

class OrderModel {
  final int id;
  final int total_price;
  final String date;
  final bool delivery;
  final bool is_delivered;
  final String mode_of_payment;
  final int cost;
  final String customer_phone;
  final List<Clothe> clothes;
  OrderModel({
    required this.id,
    required this.total_price,
    required this.date,
    required this.delivery,
    required this.is_delivered,
    required this.mode_of_payment,
    required this.cost,
    required this.customer_phone,
    required this.clothes,
  });

  OrderModel copyWith({
    int? id,
    int? total_price,
    String? date,
    bool? delivery,
    bool? is_delivered,
    String? mode_of_payment,
    int? cost,
    String? customer_phone,
    List<Clothe>? clothes,
  }) {
    return OrderModel(
      id: id ?? this.id,
      total_price: total_price ?? this.total_price,
      date: date ?? this.date,
      delivery: delivery ?? this.delivery,
      is_delivered: is_delivered ?? this.is_delivered,
      mode_of_payment: mode_of_payment ?? this.mode_of_payment,
      cost: cost ?? this.cost,
      customer_phone: customer_phone ?? this.customer_phone,
      clothes: clothes ?? this.clothes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'total_price': total_price,
      'date': date,
      'delivery': delivery,
      'is_delivered': is_delivered,
      'mode_of_payment': mode_of_payment,
      'cost': cost,
      'customer_phone': customer_phone,
      'clothes': clothes.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as int,
      total_price: map['total_price'] as int,
      date: map['date'] as String,
      delivery: map['delivery'] as bool,
      is_delivered: map['is_delivered'] as bool,
      mode_of_payment: map['mode_of_payment'] as String,
      cost: map['cost'] as int,
      customer_phone: map['customer_phone'] as String,
      clothes: List<Clothe>.from(
        (map['clothes'] as List<dynamic>).map<Clothe>(
          (x) => Clothe.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, total_price: $total_price, date: $date, delivery: $delivery, is_delivered: $is_delivered, mode_of_payment: $mode_of_payment, cost: $cost, customer_phone: $customer_phone, clothes: $clothes)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.total_price == total_price &&
        other.date == date &&
        other.delivery == delivery &&
        other.is_delivered == is_delivered &&
        other.mode_of_payment == mode_of_payment &&
        other.cost == cost &&
        other.customer_phone == customer_phone &&
        listEquals(other.clothes, clothes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        total_price.hashCode ^
        date.hashCode ^
        delivery.hashCode ^
        is_delivered.hashCode ^
        mode_of_payment.hashCode ^
        cost.hashCode ^
        customer_phone.hashCode ^
        clothes.hashCode;
  }
}

class Clothe {
  final int quantity;
  final int price;
  final GetClothesByCategoryModel clothes;
  Clothe({
    required this.quantity,
    required this.price,
    required this.clothes,
  });

  Clothe copyWith({
    int? quantity,
    int? price,
    GetClothesByCategoryModel? clothes,
  }) {
    return Clothe(
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      clothes: clothes ?? this.clothes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'price': price,
      'clothes': clothes.toMap(),
    };
  }

  factory Clothe.fromMap(Map<String, dynamic> map) {
    return Clothe(
      quantity: map['quantity'] as int,
      price: map['price'] as int,
      clothes: GetClothesByCategoryModel.fromMap(
          map['clothes'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Clothe.fromJson(String source) =>
      Clothe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Clothe(quantity: $quantity, price: $price, clothes: $clothes)';

  @override
  bool operator ==(covariant Clothe other) {
    if (identical(this, other)) return true;

    return other.quantity == quantity &&
        other.price == price &&
        other.clothes == clothes;
  }

  @override
  int get hashCode => quantity.hashCode ^ price.hashCode ^ clothes.hashCode;
}
