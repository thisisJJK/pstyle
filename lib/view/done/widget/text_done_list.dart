import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pstyle/view_model/done_view_model.dart';

class TextDoneList extends StatelessWidget {
  TextDoneList({super.key});
  final DoneViewModel _doneViewModel = Get.find<DoneViewModel>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Done List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        Obx(()=>
          Text(
            '총 ${_doneViewModel.filtedByIsDoneMust.length}개',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ),
      ],
    );
  }
}
