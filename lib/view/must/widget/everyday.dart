import 'package:flutter/material.dart';

class Everyday extends StatelessWidget {
  const Everyday({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '매일반복 MUST',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 21,
      ),
    );
  }
}
