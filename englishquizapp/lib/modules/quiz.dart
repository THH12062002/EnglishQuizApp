// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/choose_lv/chooselv_binding.dart';
import 'package:englishquizapp/modules/choose_lv/chooselv_page.dart';
import 'package:englishquizapp/modules/home/home_binding.dart';
import 'package:englishquizapp/modules/home/home_page.dart';
import 'package:englishquizapp/modules/login/login_binding.dart';
import 'package:englishquizapp/modules/login/login_page.dart';
import 'package:englishquizapp/modules/questions/question_page.dart';
import 'package:englishquizapp/modules/questions/widgets/question_binding.dart';
import 'package:englishquizapp/modules/signup/signup_binding.dart';
import 'package:englishquizapp/modules/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    return ScreenUtilInit(
      designSize: const Size(402, 826),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/login',
          getPages: [
            GetPage(
              name: '/login',
              page: () => LoginPage(),
              binding: LoginBinding(),
            ),
            GetPage(
              name: '/home',
              page: () => HomePage(),
              binding: HomeBinding(),
            ),
            GetPage(
              name: '/chooselv',
              page: () => ChooseLvPage(),
              binding: ChooseLvBinding(),
            ),
            GetPage(
              name: '/question',
              page: () => QuestionPage(),
              binding: QuestionBinding(),
            ),
            GetPage(
              name: '/signup',
              page: () => SignUpPage(),
              binding: SignUpBinding(),
            )
            // GetPage(name: '/second', page: () => Second()),
          ],
        );
      },
    );
  }
}
