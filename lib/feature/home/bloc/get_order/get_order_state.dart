import 'package:fashion_app/core/domain/model/order/order_model.dart';

class GetOrderState {}

final class GetOrderInitial extends GetOrderState {}

class GetOrderSuccessState extends GetOrderState {
  final List<OrderModel> order;

  GetOrderSuccessState({required this.order});
}

class GetOrderLoadingState extends GetOrderState {}

class GetOrderFieldState extends GetOrderState {}
