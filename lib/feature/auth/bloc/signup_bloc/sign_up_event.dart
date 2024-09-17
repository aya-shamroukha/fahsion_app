import 'package:fashion_app/core/domain/model/auth/signup_model.dart';

class SignUpEvent {}

class SignUpSuccess extends SignUpEvent {
  final SignupModel signUpModel;

  SignUpSuccess(this.signUpModel);
}

class SignUpField extends SignUpEvent {}

class SignUpLoading extends SignUpEvent {}

class PasswordEvent extends SignUpEvent {
  final bool isScreat;

  PasswordEvent(this.isScreat);
}
