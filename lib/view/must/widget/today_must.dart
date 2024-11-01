import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pstyle/view_model/must_view_model.dart';

class TodayMust extends StatelessWidget {
  TodayMust({super.key});
  final MustViewModel mustViewModel = Get.find<MustViewModel>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          '오늘의 MUST',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        const Spacer(),
        Obx(() {
          return Text(
            '${mustViewModel.filtedByIsDoneMust.length}/${mustViewModel.filtedBydateMust.length}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          );
        }),
      ],
    );
  }
}
