import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pstyle/view/done/widget/done_card.dart';
import 'package:pstyle/view/done/widget/month.dart';
import 'package:pstyle/view/done/widget/text_done_list.dart';
import 'package:pstyle/view_model/done_view_model.dart';

class DoneView extends StatelessWidget {
  DoneView({super.key});
  final DoneViewModel _doneViewModel = Get.find<DoneViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Month(),
               TextDoneList(),
              const SizedBox(
                height: 5,
              ),
              Obx(() {
                final done = _doneViewModel.filtedByIsDoneMust;
                return Expanded(
                  child: ListView.separated(
                    itemCount: done.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return DoneCard(done: done[index]);
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
