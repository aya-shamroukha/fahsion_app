class GetClothesByIdEvent {}

class GetClothesByIdSuccessEvent extends GetClothesByIdEvent {
  final dynamic id;

  GetClothesByIdSuccessEvent({required this.id});
}

class IsCommentTrueEvent extends GetClothesByIdEvent {
  final bool isComment;

  IsCommentTrueEvent({required this.isComment});
}
