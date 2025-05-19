import 'package:flutter_bloc/flutter_bloc.dart';
import 'quiz_event.dart';
import 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizState.initial()) {
    on<AnswerSelected>((event, emit) {
      emit(state.copyWith(selectedAnswerIndex: event.selectedIndex));
    });

    on<NextQuestion>((event, emit) {
      final isCorrect = state.selectedAnswerIndex ==
          state.questions[state.currentIndex].correctAnswerIndex;
      final newScore = isCorrect ? state.score + 1 : state.score;

      if (state.currentIndex + 1 == state.questions.length) {
        emit(state.copyWith(
          score: newScore,
          isQuizCompleted: true,
          selectedAnswerIndex: null,
        ));
      } else {
        emit(state.copyWith(
          currentIndex: state.currentIndex + 1,
          score: newScore,
          selectedAnswerIndex: null,
        ));
      }
    });

    on<ResetQuiz>((event, emit) {
      emit(QuizState.initial());
    });
  }
}
