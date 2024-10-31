import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pstyle/view_model/must_view_model.dart';

class MustCard extends StatelessWidget {
  MustCard({super.key});

  final MustViewModel _mustViewModel = Get.find<MustViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
        height: 60,
        decoration: BoxDecoration(
          color: _mustViewModel.isDoneChecked.value
              ? Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade700
                  : Colors.grey.shade400
              : Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            //체크박스
            Checkbox(
              shape: const CircleBorder(),
              value: _mustViewModel.isDoneChecked.value,
              onChanged: (value) {
                _mustViewModel.isDoneChecked.value = value!;
              },
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //중요여부
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
              'ui 작업 마무리',
              style: TextStyle(
                fontSize: 16,
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
                  '07:30까지',
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                //소요시간
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
                      '20분',
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
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
