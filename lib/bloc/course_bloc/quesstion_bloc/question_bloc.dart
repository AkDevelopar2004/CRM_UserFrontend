import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  late Timer _timer;

  QuestionBloc()
      : super(QuestionLoadedState(
          questionIndex: 0,
          selectedOption: -1,
          timeRemaining: 10,
          options: ["Option A", "Option B", "Option C", "Option D"],
        )) {
    on<SelectOptionEvent>(_onSelectOption);
    on<NextQuestionEvent>(_onNextQuestion);
    on<PreviousQuestionEvent>(_onPreviousQuestion);
    on<TickEvent>(_onTick);

    _startTimer();
  }

  void _onSelectOption(SelectOptionEvent event, Emitter<QuestionState> emit) {
    if (state is QuestionLoadedState) {
      emit(
          (state as QuestionLoadedState).copyWith(selectedOption: event.index));
    }
  }

  void _onNextQuestion(NextQuestionEvent event, Emitter<QuestionState> emit) {
    if (state is QuestionLoadedState) {
      final current = state as QuestionLoadedState;
      if (current.questionIndex < 9) {
        emit(current.copyWith(
          questionIndex: current.questionIndex + 1,
          selectedOption: -1,
          timeRemaining: 10,
        ));
      }
    }
  }

  void _onPreviousQuestion(
      PreviousQuestionEvent event, Emitter<QuestionState> emit) {
    if (state is QuestionLoadedState) {
      final current = state as QuestionLoadedState;
      if (current.questionIndex > 0) {
        emit(current.copyWith(
          questionIndex: current.questionIndex - 1,
          selectedOption: -1,
          timeRemaining: 10,
        ));
      }
    }
  }

  void _onTick(TickEvent event, Emitter<QuestionState> emit) {
    if (state is QuestionLoadedState) {
      final current = state as QuestionLoadedState;
      if (current.timeRemaining > 0) {
        emit(current.copyWith(timeRemaining: current.timeRemaining - 1));
      }
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(TickEvent());
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
