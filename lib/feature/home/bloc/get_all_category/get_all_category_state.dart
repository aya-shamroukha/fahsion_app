import '../../../../core/domain/model/category/get_all_category.dart';

class GetAllCategoryState {}

final class GetAllCategoryInitial extends GetAllCategoryState {}

class GetAllCategorySuccessState extends GetAllCategoryState {
  final List<GetAllCategoryModel> allcategory;

  GetAllCategorySuccessState({required this.allcategory});
}

class GetAllCategoryLoadingState extends GetAllCategoryState {}

class GetAllCategoryFieldState extends GetAllCategoryState {}
