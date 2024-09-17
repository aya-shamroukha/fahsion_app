import '../../../../core/domain/model/auth/login_model.dart';

class LogInEvent {}

class LogInSuccess extends LogInEvent {
  final LoginModel logInModel;

  LogInSuccess(this.logInModel);
}

class LogInField extends LogInEvent {}

class LogInLoading extends LogInEvent {}

class PasswordEvent extends LogInEvent {
  final bool isScreat;

  PasswordEvent(this.isScreat);
}
