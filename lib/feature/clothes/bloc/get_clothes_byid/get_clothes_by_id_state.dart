import '../../../../core/domain/model/clothes/get_clothes_by_category.dart';

class GetClothesByIdState {}

final class GetClothesByIdInitial extends GetClothesByIdState {}

class GetClothesByIdSuccessState extends GetClothesByIdState {
  final GetClothesByCategoryModel clothes;

  GetClothesByIdSuccessState({required this.clothes});
}

class GetClothesByIdLoadingState extends GetClothesByIdState {}

class GetClothesByIdField extends GetClothesByIdState {}

class IsCommentState extends GetClothesByIdState {}
