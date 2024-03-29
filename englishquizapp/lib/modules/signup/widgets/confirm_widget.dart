import 'package:flutter/material.dart';

class ConfirmWidget extends StatefulWidget {
  const ConfirmWidget({super.key});

  @override
  State<ConfirmWidget> createState() {
    return _ConfirmWidget();
  }
}

class _ConfirmWidget extends State<ConfirmWidget> {
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
          hintText: 'Confirm Password',
          prefixIcon: Icon(Icons.confirmation_num_outlined),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
