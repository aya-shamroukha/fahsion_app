// ignore_for_file: avoid_print

import 'package:fashion_app/core/domain/model/patron/get_all_patron.dart';
import 'package:fashion_app/core/domain/service/patron_service.dart';
import 'package:fashion_app/feature/home/bloc/get_all_patron/get_all_patron_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_all_patron_event.dart';

class GetAllPatronBloc extends Bloc<GetAllPatronEvent, GetAllPatronState> {
  GetAllPatronBloc() : super(GetAllPatronInitial()) {
    on<GetAllPatronSuccessEvent>((event, emit) async {
      emit(GetAllPatronLoadingState());
      print('-----------------------------------befor');
      try {
        var allpatron = await PatronImpl().getAllPatron();
        print(allpatron);
        List<GetAllPatronModel> patrondata = List.generate(
            allpatron['data'].length,
            (index) => GetAllPatronModel.fromMap(
                (allpatron['data'][index] as Map<String, dynamic>)));
        emit(GetAllPatronSuccessState(allPatron: patrondata));
      } catch (e) {
        emit(GetAllPatronFieldState());
      }
    });
  }
}
