// ignore_for_file: prefer_const_constructors

import 'package:englishquizapp/modules/home/home.dart';
import 'package:englishquizapp/modules/home/home_binding.dart';
import 'package:englishquizapp/modules/login/login_binding.dart';
import 'package:englishquizapp/modules/login/login_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            // GetPage(name: '/second', page: () => Second()),
          ],
        );
      },
    );
  }
}
