// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class AddCommentModel {
  final int new_account;

  final int clothes;
  final String description;

  AddCommentModel(
      {required this.new_account,
      required this.clothes,
      required this.description});

  AddCommentModel copyWith({
    int? new_account,
    int? clothes,
    String? description,
  }) {
    return AddCommentModel(
      new_account: new_account ?? this.new_account,
      clothes: clothes ?? this.clothes,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'new_account': new_account,
      'clothes': clothes,
      'description': description,
    };
  }

  factory AddCommentModel.fromMap(Map<String, dynamic> map) {
    return AddCommentModel(
      new_account: map['new_account'] as int,
      clothes: map['clothes'] as int,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddCommentModel.fromJson(String source) =>
      AddCommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AddCommentModel(new_account: $new_account, clothes: $clothes, description: $description)';

  @override
  bool operator ==(covariant AddCommentModel other) {
    if (identical(this, other)) return true;

    return other.new_account == new_account &&
        other.clothes == clothes &&
        other.description == description;
  }

  @override
  int get hashCode =>
      new_account.hashCode ^ clothes.hashCode ^ description.hashCode;
}
