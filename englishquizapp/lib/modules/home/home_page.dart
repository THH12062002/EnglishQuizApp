// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:englishquizapp/modules/home/blocks/logo_block.dart';
import 'package:englishquizapp/modules/home/blocks/logout_block.dart';
import 'package:englishquizapp/modules/home/blocks/playbtn_block.dart';
import 'package:englishquizapp/modules/home/blocks/title_block.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //UserStorage userStorage = Get.find<UserStorage>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(235, 115, 102, 251),
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 60),
              TitleBlock(),
              SizedBox(height: 180),
              LogoBlock(),
              SizedBox(height: 220),
              PlayBtnBlock(),
              SizedBox(height: 20),
              LogoutBlock(),
            ],
          ),
        ),
      ),
    );
  }
}
