// ignore_for_file: avoid_print

import 'package:fashion_app/core/domain/model/clothes/get_clothes_by_category.dart';
import 'package:fashion_app/core/domain/service/clothes_service.dart';
import 'package:fashion_app/feature/clothes/bloc/get_clothes_byid/get_clothes_by_id_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_clothes_by_id_state.dart';

class GetClothesByIdBloc
    extends Bloc<GetClothesByIdEvent, GetClothesByIdState> {
  bool iscomment = false;
  GetClothesByIdBloc() : super(GetClothesByIdInitial()) {
    on<GetClothesByIdSuccessEvent>((event, emit) async {
      emit(GetClothesByIdLoadingState());
      print('-----------------------------------befor');
      try {
        var allclothes = await ClothesImpl().getClothesById(event.id);
        print(allclothes);
        GetClothesByCategoryModel clothesdata =
            GetClothesByCategoryModel.fromMap((allclothes['data']));
        emit(GetClothesByIdSuccessState(clothes: clothesdata));
        print('------------------------------------------');
        print(clothesdata);
      } catch (e) {
        print(e.toString());
        emit(GetClothesByIdField());
      }
    });
    on<IsCommentTrueEvent>(
      (event, emit) {
        iscomment = !iscomment;
        emit(IsCommentState());
      },
    );
  }
}
