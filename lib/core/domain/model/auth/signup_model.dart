// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignupModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  SignupModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  SignupModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) {
    return SignupModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory SignupModel.fromMap(Map<String, dynamic> map) {
    return SignupModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupModel.fromJson(String source) =>
      SignupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignupModel(name: $name, email: $email, phone: $phone, password: $password)';
  }

  @override
  bool operator ==(covariant SignupModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ phone.hashCode ^ password.hashCode;
  }
}
