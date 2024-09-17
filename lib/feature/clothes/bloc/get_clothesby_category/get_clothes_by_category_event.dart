class GetClothesByCategoryEvent {}

class GetClothesByCategorySuccessEvent extends GetClothesByCategoryEvent {
  final dynamic id;

  GetClothesByCategorySuccessEvent({required this.id});
}
