part of 'question_bloc.dart';

sealed class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object> get props => [];
}

class SelectOptionEvent extends QuestionEvent {
  final int index;

  const SelectOptionEvent(this.index);

  @override
  List<Object> get props => [index];
}

class NextQuestionEvent extends QuestionEvent {}

class PreviousQuestionEvent extends QuestionEvent {}

class TickEvent extends QuestionEvent {}
