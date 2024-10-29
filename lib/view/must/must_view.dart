import 'package:flutter/material.dart';
import 'package:pstyle/view/must/widget/every_card.dart';
import 'package:pstyle/view/must/widget/everyday.dart';
import 'package:pstyle/view/must/widget/must_card.dart';
import 'package:pstyle/view/must/widget/today_must.dart';
import 'package:pstyle/view/must/widget/week.dart';

class MustView extends StatelessWidget {
  const MustView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //매일
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Everyday(),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 3,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return EveryCard();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //오늘의 머스트
              Column(
                children: [
                  const TodayMust(),
                  //머스트 카드
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
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
                ],
              ),

              //주간 달력
              Week(),
            ],
          ),
        ),
      ),
    );
  }
}
