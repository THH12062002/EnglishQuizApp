import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: 320,
      height: 60,
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
