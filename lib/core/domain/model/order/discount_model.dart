// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class DiscountModel {
  final int id;
  final String name;
  final double precentage;
  final String from_date;

  final String to_date;
  int count;
  DiscountModel({
    required this.id,
    required this.name,
    required this.precentage,
    required this.from_date,
    required this.to_date,
    required this.count,
  });

  DiscountModel copyWith({
    int? id,
    String? name,
    double? precentage,
    String? from_date,
    String? to_date,
    int? count,
  }) {
    return DiscountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      precentage: precentage ?? this.precentage,
      from_date: from_date ?? this.from_date,
      to_date: to_date ?? this.to_date,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'precentage': precentage,
      'from_date': from_date,
      'to_date': to_date,
      'count': count,
    };
  }

  factory DiscountModel.fromMap(Map<String, dynamic> map) {
    return DiscountModel(
      id: map['id'] as int,
      name: map['name'] as String,
      precentage: map['precentage'] as double,
      from_date: map['from_date'] as String,
      to_date: map['to_date'] as String,
      count: map['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscountModel.fromJson(String source) =>
      DiscountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DiscountModel(id: $id, name: $name, precentage: $precentage, from_date: $from_date, to_date: $to_date, count: $count)';
  }

  @override
  bool operator ==(covariant DiscountModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.precentage == precentage &&
        other.from_date == from_date &&
        other.to_date == to_date &&
        other.count == count;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        precentage.hashCode ^
        from_date.hashCode ^
        to_date.hashCode ^
        count.hashCode;
  }
}
