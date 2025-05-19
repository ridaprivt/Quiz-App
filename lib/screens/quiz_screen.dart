import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/widgets/option_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../bloc/quiz_bloc.dart';
import '../../bloc/quiz_event.dart';
import '../../bloc/quiz_state.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 51, 13, 58),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 51, 13, 58),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state.isQuizCompleted) {
              return ResultScreen(
                  score: state.score, total: state.questions.length);
            }

            final question = state.questions[state.currentIndex];

            return Padding(
              padding: EdgeInsets.all(5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Text(
                    "Question ${state.currentIndex + 1} of ${state.questions.length}",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    question.question,
                    style: TextStyle(fontSize: 19.sp),
                  ),
                  SizedBox(height: 3.h),
                  ...List.generate(question.options.length, (index) {
                    final isSelected = state.selectedAnswerIndex == index;

                    return OptionCard(
                      optionText: question.options[index],
                      isSelected: isSelected,
                      onTap: () {
                        context.read<QuizBloc>().add(AnswerSelected(index));
                      },
                    );
                  }),
                  const Spacer(),
                  nextButton(state, context),
                  SizedBox(height: 3.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget nextButton(QuizState state, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 3.h, top: 1.h),
        child: InkWell(
          onTap: state.selectedAnswerIndex == null
              ? null
              : () {
                  context.read<QuizBloc>().add(NextQuestion());
                },
          borderRadius: BorderRadius.circular(2.h),
          splashColor: const Color.fromARGB(255, 51, 13, 58).withOpacity(0.2),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 80.w,
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            decoration: BoxDecoration(
              color: state.selectedAnswerIndex == null
                  ? Colors.grey.shade300
                  : const Color.fromARGB(255, 118, 32, 133),
              borderRadius: BorderRadius.circular(2.h),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(37, 0, 0, 0),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: state.selectedAnswerIndex == null
                      ? Colors.black38
                      : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
