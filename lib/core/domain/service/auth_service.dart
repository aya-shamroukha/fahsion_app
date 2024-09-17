// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fashion_app/core/config/localstorage.dart';
import 'package:fashion_app/core/domain/model/auth/login_model.dart';
import 'package:fashion_app/core/domain/model/auth/signup_model.dart';
import 'package:fashion_app/core/domain/model/error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService {
  signUp(SignupModel signup);
  logIn(LoginModel login);
  late String baseUrl = 'http://yamen146.pythonanywhere.com/';
}

class AuthServiceImpl extends AuthService {
  @override
  logIn(login) async {
    Dio dio = Dio();
    try {
      Response response = await dio.post('${baseUrl}new_account/customer/login',
          options: Options(sendTimeout: const Duration(seconds: 60), headers: {
            "Content-Type": "application/json",
            "Connection": "keep-alive"
          }),
          data: login.toJson());
      if (response.statusCode == 200) {
        print(response.data);
        print(response.data['access_token']);
        getIt
            .get<SharedPreferences>()
            .setString('token', response.data['access_token']);
        return true;
      } else {
        print(ErrorModel(message: 'The Status Code is not 200').message);
        return false;
      }
    } on DioException catch (e) {
      print(ExceptionModel(message: e.message.toString()).message);
      return false;
    }
  }

  @override
  signUp(signup) async {
    Dio dio = Dio();
    try {
      Response response = await dio.post(
          '${baseUrl}new_account/customer/register',
          options: Options(sendTimeout: const Duration(seconds: 60), headers: {
            "Content-Type": "application/json",
            "Connection": "keep-alive"
          }),
          data: signup.toJson());
      if (response.statusCode == 200) {
        print(response);
        print(response.data['access_token']);
        getIt
            .get<SharedPreferences>()
            .setString('token', response.data['access_token']);
        return true;
      } else {
        print(ErrorModel(message: 'The Status Code is not 200').message);
        return false;
      }
    } on DioException catch (e) {
      print(ExceptionModel(message: e.message.toString()).message);
      return false;
    }
  }
}
