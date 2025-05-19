import 'package:quiz_app/model/question_model.dart';

class QuizState {
  final List<Question> questions;
  final int currentIndex;
  final int score;
  final int? selectedAnswerIndex;
  final bool isQuizCompleted;

  QuizState({
    required this.questions,
    required this.currentIndex,
    required this.score,
    this.selectedAnswerIndex,
    this.isQuizCompleted = false,
  });

  factory QuizState.initial() {
    return QuizState(
      questions: [
        Question(
          question: 'What is Flutter?',
          options: ['SDK', 'IDE', 'Language', 'Database'],
          correctAnswerIndex: 0,
        ),
        Question(
          question: 'Which language is used in Flutter?',
          options: ['Java', 'Dart', 'Swift', 'C++'],
          correctAnswerIndex: 1,
        ),
        Question(
          question: 'Which widget is used for layouts in Flutter?',
          options: ['Row', 'Column', 'Stack', 'All of these'],
          correctAnswerIndex: 3,
        ),
        Question(
          question: 'What is the purpose of hot reload in Flutter?',
          options: [
            'Restart app',
            'Deploy to Play Store',
            'Quick UI updates',
            'Fix bugs automatically'
          ],
          correctAnswerIndex: 2,
        ),
        Question(
          question: 'Which company developed Flutter?',
          options: ['Facebook', 'Google', 'Microsoft', 'Apple'],
          correctAnswerIndex: 1,
        ),
      ],
      currentIndex: 0,
      score: 0,
      selectedAnswerIndex: null,
    );
  }

  QuizState copyWith({
    int? currentIndex,
    int? score,
    int? selectedAnswerIndex,
    bool? isQuizCompleted,
  }) {
    return QuizState(
      questions: questions,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      selectedAnswerIndex: selectedAnswerIndex,
      isQuizCompleted: isQuizCompleted ?? this.isQuizCompleted,
    );
  }
}
