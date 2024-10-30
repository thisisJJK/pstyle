import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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
        height: 65,
        padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
        decoration: BoxDecoration(
          color: _mustViewModel.isDoneChecked.value
              ? Colors.grey.shade600
              : Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '동사무소 서류 제출',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 15,
              ),
            ),
            const Icon(
              FeatherIcons.plus,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
