// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetAllCategoryModel {
  final int id;
  final String name;
  GetAllCategoryModel({
    required this.id,
    required this.name,
  });

  GetAllCategoryModel copyWith({
    int? id,
    String? name,
  }) {
    return GetAllCategoryModel(
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

  factory GetAllCategoryModel.fromMap(Map<String, dynamic> map) {
    return GetAllCategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllCategoryModel.fromJson(String source) =>
      GetAllCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetAllCategoryModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant GetAllCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
