import 'package:flutter/material.dart';

class LogoBlock extends StatelessWidget {
  const LogoBlock({super.key});
  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/logo.png'),
      width: 150,
    );
  }
}
