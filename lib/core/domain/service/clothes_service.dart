// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fashion_app/core/config/localstorage.dart';
import 'package:fashion_app/core/domain/model/clothes/add_comment__model.dart';
import 'package:fashion_app/core/domain/model/error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ClothesService {
  getClothesByCategory(int id);
  getClothesById(int id);
  late String baseUrl = 'http://yamen146.pythonanywhere.com/';
  addComment(AddCommentModel addComment);
}

class ClothesImpl extends ClothesService {
  @override
  getClothesByCategory(int id) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        '${baseUrl}clothes/category/$id',
        options: Options(sendTimeout: const Duration(seconds: 60), headers: {
          "Content-Type": "application/json",
          "Connection": "keep-alive",
          "Authorization":
              "Bearer ${getIt.get<SharedPreferences>().getString('token')}"
        }),
      );
      if (response.statusCode == 200) {
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

  @override
  getClothesById(int id) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        '${baseUrl}clothes/$id',
        options: Options(sendTimeout: const Duration(seconds: 60), headers: {
          "Content-Type": "application/json",
          "Connection": "keep-alive",
          "Authorization":
              "Bearer ${getIt.get<SharedPreferences>().getString('token')}"
        }),
      );
      if (response.statusCode == 200) {
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

  @override
  addComment(AddCommentModel addComment) async {
    Dio dio = Dio();
    try {
      Response response = await dio.post(
        '${baseUrl}comment/',
        data: addComment.toJson(),
        options: Options(sendTimeout: const Duration(seconds: 60), headers: {
          "Content-Type": "application/json",
          "Connection": "keep-alive",
          "Authorization":
              "Bearer ${getIt.get<SharedPreferences>().getString('token')}"
        }),
      );
      if (response.statusCode == 200) {
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
