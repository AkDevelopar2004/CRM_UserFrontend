part of 'question_bloc.dart';

sealed class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object> get props => [];
}

class QuestionLoadedState extends QuestionState {
  final int questionIndex;
  final int selectedOption;
  final int timeRemaining;
  final List<String> options;

  const QuestionLoadedState({
    required this.questionIndex,
    required this.selectedOption,
    required this.timeRemaining,
    required this.options,
  });

  QuestionLoadedState copyWith({
    int? questionIndex,
    int? selectedOption,
    int? timeRemaining,
    List<String>? options,
  }) {
    return QuestionLoadedState(
      questionIndex: questionIndex ?? this.questionIndex,
      selectedOption: selectedOption ?? this.selectedOption,
      timeRemaining: timeRemaining ?? this.timeRemaining,
      options: options ?? this.options,
    );
  }

  @override
  List<Object> get props =>
      [questionIndex, selectedOption, timeRemaining, options];
}
