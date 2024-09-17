import 'package:fashion_app/core/domain/model/clothes/add_comment__model.dart';

class AddNewCommentEvent {}

class AddNewCommentSuccessEvent extends AddNewCommentEvent {
  final AddCommentModel addComment;

  AddNewCommentSuccessEvent({required this.addComment});
}
