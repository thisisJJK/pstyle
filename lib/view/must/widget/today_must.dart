import 'package:flutter/material.dart';

class TodayMust extends StatelessWidget {
  const TodayMust({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '오늘의 MUST',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        Spacer(),
        Text(
          '0 / 8',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
