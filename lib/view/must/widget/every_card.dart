import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pstyle/view_model/must_view_model.dart';

class EveryCard extends StatelessWidget {
  EveryCard({super.key});
  final MustViewModel _mustViewModel = Get.find<MustViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: const Alignment(-1, -1),
              child: Checkbox(
                shape: const CircleBorder(),
                value: _mustViewModel.isDoneChecked.value,
                onChanged: (value) {
                  _mustViewModel.isDoneChecked.value = value!;
                },
              ),
            ),
            Align(
              alignment: const Alignment(-0.7, 0.4),
              child: Text(
                '동사무소 서류 제출',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
