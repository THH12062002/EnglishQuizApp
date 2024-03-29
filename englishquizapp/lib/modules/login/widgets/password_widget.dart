import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() {
    return _PasswordWidget();
  }
}

class _PasswordWidget extends State<PasswordWidget> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: 320,
      height: 60,
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.password),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
