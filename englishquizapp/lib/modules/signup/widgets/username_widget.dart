import 'package:flutter/material.dart';

class UsernameWidget extends StatelessWidget {
  const UsernameWidget({super.key});

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
          hintText: 'Username',
          prefixIcon: Icon(Icons.account_box),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
