import 'package:englishquizapp/modules/home/blocks/logo_block.dart';
import 'package:englishquizapp/modules/home/blocks/logout_block.dart';
import 'package:englishquizapp/modules/home/blocks/playbtn_block.dart';
import 'package:englishquizapp/modules/home/blocks/title_block.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //final void Function() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(235, 115, 102, 251),
        ),
        alignment: Alignment.topCenter,
        child: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 70),
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
