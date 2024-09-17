// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fashion_app/core/config/localstorage.dart';
import 'package:fashion_app/core/domain/model/error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CategoryService {
  getAllCategory();
  late String baseUrl = 'http://yamen146.pythonanywhere.com/';
}

class CategoryImpl extends CategoryService {
  @override
  getAllCategory() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        '${baseUrl}category/',
        options: Options(sendTimeout: const Duration(seconds: 60), headers: {
          "Content-Type": "application/json",
          "Connection": "keep-alive",
          "Authorization":
              "Bearer ${getIt.get<SharedPreferences>().getString('token')}"
        }),
      );
      if (response.statusCode == 200) {
        print(response);

        return response.data;
      } else {
        print(ErrorModel(message: 'The Status Code is not 200').message);
        return 'false';
      }
    } on DioException catch (e) {
      print(ExceptionModel(message: e.message.toString()).message);
      return 'false';
    }
  }
}
