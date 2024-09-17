// ignore_for_file: avoid_print

import 'package:fashion_app/core/domain/service/clothes_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_new_comment_event.dart';
import 'add_new_comment_state.dart';

class AddNewCommentBloc extends Bloc<AddNewCommentEvent, AddNewCommentState> {
  AddNewCommentBloc() : super(AddNewCommentInitial()) {
    on<AddNewCommentSuccessEvent>((event, emit) async {
      emit(AddNewCommentLoadingState());
      try {
        final isSuccess = await ClothesImpl().addComment(event.addComment);
        print('----------------');
        print(isSuccess);

        emit(AddNewCommentSuccessState());
      } catch (e) {
        print(e.toString());
        emit(AddNewCommentFieldState());
      }
    });
  }
}
