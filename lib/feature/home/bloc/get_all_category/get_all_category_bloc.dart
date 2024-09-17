// ignore_for_file: avoid_print

import 'package:fashion_app/core/domain/model/category/get_all_category.dart';
import 'package:fashion_app/core/domain/service/category_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_all_category_event.dart';
import 'get_all_category_state.dart';

class GetAllCategoryBloc
    extends Bloc<GetAllCategoryEvent, GetAllCategoryState> {
  GetAllCategoryBloc() : super(GetAllCategoryInitial()) {
    on<GetAllCategorySuccessEvent>((event, emit) async {
      emit(GetAllCategoryLoadingState());
      print('-----------------------------------befor');
      try {
        var allcategory = await CategoryImpl().getAllCategory();
        print(allcategory);
        List<GetAllCategoryModel> categorydata = List.generate(
            allcategory['data'].length,
            (index) => GetAllCategoryModel.fromMap(
                (allcategory['data'][index] as Map<String, dynamic>)));
        emit(GetAllCategorySuccessState(allcategory: categorydata));
      } catch (e) {
        emit(GetAllCategoryFieldState());
      }
    });
  }
}
