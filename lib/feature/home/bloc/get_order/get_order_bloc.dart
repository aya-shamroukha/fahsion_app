// ignore_for_file: avoid_print

import 'package:fashion_app/core/domain/model/order/order_model.dart';
import 'package:fashion_app/core/domain/service/order_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_order_event.dart';
import 'get_order_state.dart';

class GetOrderBloc extends Bloc<GetOrderEvent, GetOrderState> {
  GetOrderBloc() : super(GetOrderInitial()) {
    on<GetOrderSuccessEvent>((event, emit) async {
      emit(GetOrderLoadingState());
      print('-----------------------------------befor');
      try {
        var order = await OrderImpl().getMyOreder();
        print(order);

        List<OrderModel> orderdata = List.generate(order['data'].length,
            (index) => OrderModel.fromMap((order['data'][index])));
        print('-----------------------------------');
        print(orderdata);
        emit(GetOrderSuccessState(order: orderdata));
      } catch (e) {
        print('Error: $e');
        emit(GetOrderFieldState());
      }
    });
  }
}
