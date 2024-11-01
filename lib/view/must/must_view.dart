import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pstyle/view/must/widget/must_card.dart';
import 'package:pstyle/view/must/widget/today_must.dart';
import 'package:pstyle/view/must/widget/week.dart';
import 'package:pstyle/view_model/must_view_model.dart';

class MustView extends StatelessWidget {
  MustView({super.key});
  final MustViewModel mustViewModel = Get.find<MustViewModel>();

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
               TodayMust(),
              //머스트 카드
              Obx(() {
                final must = mustViewModel.filtedBydateMust;

                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: must.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MustCard(
                        must: must[index],
                      );
                    },
                  ),
                );
              }),

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
