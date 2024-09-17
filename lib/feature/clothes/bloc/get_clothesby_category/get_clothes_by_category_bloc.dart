// ignore_for_file: avoid_print

import 'package:fashion_app/core/domain/model/clothes/get_clothes_by_category.dart';
import 'package:fashion_app/core/domain/service/clothes_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_clothes_by_category_event.dart';
import 'get_clothes_by_category_state.dart';

class GetClothesByCategoryBloc
    extends Bloc<GetClothesByCategoryEvent, GetClothesByCategoryState> {
  GetClothesByCategoryBloc() : super(GetClothesByCategoryInitial()) {
    on<GetClothesByCategorySuccessEvent>((event, emit) async {
      emit(GetClothesByCategoryLoadingState());
      print('-----------------------------------befor');
      try {
        var allclothes = await ClothesImpl().getClothesByCategory(event.id);
        print(allclothes);
        List<GetClothesByCategoryModel> clothesdata = List.generate(
            allclothes['data'].length,
            (index) =>
                GetClothesByCategoryModel.fromMap((allclothes['data'][index])));
        emit(GetClothesByCategorySuccessState(clothes: clothesdata));
        print('------------------------------------------');
        print(clothesdata);
      } catch (e) {
        print(e.toString());
        emit(GetClothesByCategoryFieldState());
      }
    });
  }
}
