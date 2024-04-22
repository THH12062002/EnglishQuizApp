import 'package:flutter/material.dart';

class QuestionFlagHandle extends StatelessWidget {
  final bool isFlagged;
  final ValueChanged<bool> onFlagChanged;

  const QuestionFlagHandle({
    super.key,
    required this.isFlagged,
    required this.onFlagChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFlagged ? Icons.flag : Icons.outlined_flag,
        color: isFlagged ? Colors.yellow : Colors.grey,
      ),
      onPressed: () {
        onFlagChanged(!isFlagged);
      },
    );
  }
}
