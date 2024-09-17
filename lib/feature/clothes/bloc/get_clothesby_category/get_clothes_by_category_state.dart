import 'package:fashion_app/core/domain/model/clothes/get_clothes_by_category.dart';

class GetClothesByCategoryState {}

final class GetClothesByCategoryInitial extends GetClothesByCategoryState {}

class GetClothesByCategorySuccessState extends GetClothesByCategoryState {
  final List<GetClothesByCategoryModel> clothes;

  GetClothesByCategorySuccessState({required this.clothes});
}

class GetClothesByCategoryLoadingState extends GetClothesByCategoryState {}

class GetClothesByCategoryFieldState extends GetClothesByCategoryState {}
