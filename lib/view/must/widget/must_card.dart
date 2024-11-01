import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pstyle/model/must_item_model.dart';
import 'package:pstyle/view_model/must_view_model.dart';

class MustCard extends StatelessWidget {
  final MustItemModel must;
  MustCard({super.key, required this.must});

  final MustViewModel _mustViewModel = Get.find<MustViewModel>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //수정
      },
      onLongPress: () {
        //삭제
        Get.dialog(
          Dialog(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '삭제하시겠습니까?',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _mustViewModel.delMust(must.id!);
                          _mustViewModel
                              .loadMustBydate(_mustViewModel.selectedDay.value);
                          Get.back();
                        },
                        child: const Text(
                          '삭제',
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        child: const Text(
                          '취소',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
        height: 60,
        decoration: BoxDecoration(
          color: must.isDone
              ? Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade800
                  : Colors.grey.shade500
              : Theme.of(context).colorScheme.primary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            //체크박스
            Checkbox(
              shape: const CircleBorder(),
              value: must.isDone,
              onChanged: (value) {
                _mustViewModel.toggleDone(must.id!);
              },
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //중요여부
                if (must.isImportant!)
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
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                //매일여부
                if (must.isDaily!)
                  Container(
                    width: 35,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.green),
                      color: Colors.green.shade100.withOpacity(0.9),
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
              must.title,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                  _mustViewModel.deadlineFormattedTime(must.deadline),
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                if (must.estimatedTime != null)
                  const SizedBox(
                    width: 5,
                  ),
                //소요시간
                if (must.estimatedTime != 0)
                  Container(
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
                        '${must.estimatedTime}분',
                        style: TextStyle(
                          fontSize: 11,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
