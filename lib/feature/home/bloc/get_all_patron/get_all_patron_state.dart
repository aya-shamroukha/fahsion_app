import 'package:fashion_app/core/domain/model/patron/get_all_patron.dart';

class GetAllPatronState {}

final class GetAllPatronInitial extends GetAllPatronState {}

class GetAllPatronSuccessState extends GetAllPatronState {
  final List<GetAllPatronModel> allPatron;

  GetAllPatronSuccessState({required this.allPatron});
}

class GetAllPatronLoadingState extends GetAllPatronState {}

class GetAllPatronFieldState extends GetAllPatronState {}
