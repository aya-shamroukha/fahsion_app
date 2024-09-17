// ignore_for_file: avoid_print

import 'package:fashion_app/core/domain/model/order/discount_model.dart';
import 'package:fashion_app/core/domain/service/order_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_all_discount_event.dart';
import 'get_all_discount_state.dart';

class GetAllDiscountBloc
    extends Bloc<GetAllDiscountEvent, GetAllDiscountState> {
  GetAllDiscountBloc() : super(GetAllDiscountInitial()) {
    on<GetAllDiscountSuccessEvent>((event, emit) async {
      emit(GetAllDiscountLoadingState());
      print('-----------------------------------befor');
      try {
        var discount = await OrderImpl().getAlldiscount();
        print(discount);

        List<DiscountModel> discountdata = List.generate(
            discount['data'].length,
            (index) => DiscountModel.fromMap((discount['data'][index])));
        print('-----------------------------------');
        print(discountdata);
        emit(GetAllDiscountSuccessState(discount: discountdata));
      } catch (e) {
        print('Error: $e');
        emit(GetAllDiscountFieldState());
      }
    });
  }
}
