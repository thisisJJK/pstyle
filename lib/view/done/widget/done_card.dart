import 'package:flutter/material.dart';

class DoneCard extends StatelessWidget {
  const DoneCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          //체크박스
          Checkbox(
            shape: const CircleBorder(),
            value: true,
            onChanged: (value) {},
          ),

          //중요여부
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.pink.shade500),
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                child: Center(
                  child: Text(
                    '중요',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
              Container(
                width: 45,
                height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                child: Text(
                  '200분',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          //할일
          Text(
            'ui 작업 마무리',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          const SizedBox(
            width: 5,
          ),

          const Spacer(),

          //데드라인
          Text(
            '17:30완료',
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          )
        ],
      ),
    );
  }
}
