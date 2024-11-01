import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pstyle/model/must_item_model.dart';
import 'package:pstyle/view_model/done_view_model.dart';

class DoneCard extends StatelessWidget {
  final MustItemModel done;
  DoneCard({super.key, required this.done});
  final DoneViewModel _doneViewModel = Get.find<DoneViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey.shade700
            : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          //체크박스
          Checkbox(
            shape: const CircleBorder(),
            value: true,
            onChanged: (value) {},
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //중요여부
              if (done.isImportant!)
                Container(
                  width: 35,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.pink.shade500),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Text(
                    '중요',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              //매일여부
              if (done.isDaily!)
                Container(
                  width: 35,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.green),
                    color: Colors.green.shade100,
                  ),
                  child: const Text(
                    '매일',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
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
            done.title,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          const Spacer(),

          const SizedBox(
            width: 5,
          ),
          //데드라인
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _doneViewModel.deadlineFormattedTime(done.deadline),
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              //소요시간
              if (done.estimatedTime != 0)
                Container(
                  width: 43,
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${done.estimatedTime}분',
                      style: TextStyle(
                        fontSize: 11,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
