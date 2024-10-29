import 'package:flutter/material.dart';

class TextDoneList extends StatelessWidget {
  const TextDoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Done List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        Text(
          '총 10개',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ],
    );
  }
}
