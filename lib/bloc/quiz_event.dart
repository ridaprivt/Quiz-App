abstract class QuizEvent {}

class AnswerSelected extends QuizEvent {
  final int selectedIndex;
  AnswerSelected(this.selectedIndex);
}

class NextQuestion extends QuizEvent {}

class ResetQuiz extends QuizEvent {}
