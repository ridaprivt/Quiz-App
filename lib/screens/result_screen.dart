import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../bloc/quiz_bloc.dart';
import '../../bloc/quiz_event.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  String getFeedback(int score) {
    if (score <= 2) return "Keep practicing!";
    if (score <= 4) return "Good job!";
    return "Excellent!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emoji_events,
                  color: const Color.fromARGB(255, 118, 32, 133), size: 10.h),
              SizedBox(height: 2.h),
              Text(
                "You scored $score out of $total",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 118, 32, 133),
                ),
              ),
              SizedBox(height: 1.5.h),
              Text(
                getFeedback(score),
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5.h),
              InkWell(
                onTap: () {
                  context.read<QuizBloc>().add(ResetQuiz());
                },
                borderRadius: BorderRadius.circular(2.h),
                splashColor:
                    const Color.fromARGB(255, 118, 32, 133).withOpacity(0.2),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 70.w,
                  padding: EdgeInsets.symmetric(vertical: 1.8.h),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 118, 32, 133),
                    borderRadius: BorderRadius.circular(2.h),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(40, 0, 0, 0),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Try Again",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
