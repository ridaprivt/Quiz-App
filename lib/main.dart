import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'bloc/quiz_bloc.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (_) => QuizBloc(),
            child: const SafeArea(child: QuizScreen()),
          ),
        );
      },
    );
  }
}
