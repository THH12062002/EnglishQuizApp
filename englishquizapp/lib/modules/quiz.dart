//import 'package:englishquizapp/modules/login/login.dart';
import 'package:englishquizapp/modules/login/login.dart';

import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(235, 115, 102, 251),
          ),
          child: const Login(),
        ),
      ),
    );
  }
}
