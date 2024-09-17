import '../../../../core/domain/model/order/discount_model.dart';

class GetAllDiscountState {}

final class GetAllDiscountInitial extends GetAllDiscountState {}

class GetAllDiscountSuccessState extends GetAllDiscountState {
  final List<DiscountModel> discount;

  GetAllDiscountSuccessState({required this.discount});
}

class GetAllDiscountLoadingState extends GetAllDiscountState {}

class GetAllDiscountFieldState extends GetAllDiscountState {}
