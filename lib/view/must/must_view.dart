import 'package:flutter/material.dart';
import 'package:pstyle/view/must/widget/must_card.dart';
import 'package:pstyle/view/must/widget/today_must.dart';
import 'package:pstyle/view/must/widget/week.dart';

class MustView extends StatelessWidget {
  const MustView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //오늘의 머스트
              const TodayMust(),
              //머스트 카드
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return MustCard();
                  },
                ),
              ),

              //주간 달력
              Week(),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
