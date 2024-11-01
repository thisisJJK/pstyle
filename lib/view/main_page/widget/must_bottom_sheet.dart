import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:pstyle/view_model/must_view_model.dart';

class MustBottomSheet extends StatelessWidget {
  const MustBottomSheet({
    super.key,
    required this.mustViewModel,
    required this.titleController,
    required this.hourController,
    required this.minController,
    required this.estimatedTimeController,
  });

  final MustViewModel mustViewModel;
  final TextEditingController titleController;
  final TextEditingController hourController;
  final TextEditingController minController;
  final TextEditingController estimatedTimeController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //selected day
          Row(
            children: [
              Text(
                mustViewModel.getFormattedDate(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const Spacer(),
              Center(
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    FeatherIcons.x,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              helperText: '필수',
              hintText: '해야할 일을 입력하세요.',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 76,
                child: TextField(
                  controller: hourController,
                  decoration: InputDecoration(
                    helperText: '필수',
                    hintText: '시',
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 76,
                child: TextField(
                  controller: minController,
                  decoration: InputDecoration(
                    helperText: '필수',
                    hintText: '분',
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (hourController.text.isEmpty) hourController.text = '0';

                  hourController.text =
                      (int.parse(hourController.text) + 1).toString();
                  if (int.parse(hourController.text) > 23)
                    hourController.text = '0';
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Text(
                    '+1시',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (hourController.text.isEmpty) hourController.text = '0';

                  hourController.text =
                      (int.parse(hourController.text) + 10).toString();
                  if (int.parse(hourController.text) > 23)
                    hourController.text = '0';
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Text(
                    '+10시',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (minController.text.isEmpty) minController.text = '0';

                  minController.text =
                      (int.parse(minController.text) + 30).toString();
                  if (int.parse(minController.text) > 59)
                    minController.text = '00';
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Text(
                    '+30분',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 160,
                child: TextField(
                  controller: estimatedTimeController,
                  decoration: InputDecoration(
                    helperText: '선택',
                    hintText: '예상소요시간',
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (estimatedTimeController.text.isEmpty)
                    estimatedTimeController.text = '0';
                  estimatedTimeController.text =
                      (int.parse(estimatedTimeController.text) + 5).toString();
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Text(
                    '+5분',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (estimatedTimeController.text.isEmpty)
                    estimatedTimeController.text = '0';
                  estimatedTimeController.text =
                      (int.parse(estimatedTimeController.text) + 10).toString();
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Text(
                    '+10분',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (estimatedTimeController.text.isEmpty)
                    estimatedTimeController.text = '0';
                  estimatedTimeController.text =
                      (int.parse(estimatedTimeController.text) + 30).toString();
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Text(
                    '+30분',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          //중요, 매일 체크박스
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Checkbox(
                  value: mustViewModel.isImportant.value,
                  onChanged: (value) =>
                      mustViewModel.isImportant.value = value!,
                ),
              ),
              const Text('중요'),
              Obx(
                () => Checkbox(
                  value: mustViewModel.isDaily.value,
                  onChanged: (value) => mustViewModel.isDaily.value = value!,
                ),
              ),
              const Text('매일반복 (14일)'),
            ],
          ),

          const SizedBox(
            height: 12,
          ),
          //추가 버튼
          GestureDetector(
            onTap: () {
              mustViewModel.setDeadline(
                  hourController.text, minController.text);
              mustViewModel.setEstimatedTime(estimatedTimeController.text);
              if (titleController.text.isEmpty ||
                  hourController.text.isEmpty ||
                  minController.text.isEmpty) {
                Get.snackbar(
                  '!',
                  '필수 MUST 정보를 입력해주세요',
                  backgroundColor: Colors.red.shade200,
                  snackPosition: SnackPosition.TOP,
                );
              }

              if (titleController.text.isNotEmpty &&
                  hourController.text.isNotEmpty &&
                  minController.text.isNotEmpty) {
                mustViewModel.addMustItem(
                  titleController.text,
                  mustViewModel.deadlineTime.value,
                  estimatedTime: mustViewModel.estimatedTime.value,
                  isImportant: mustViewModel.isImportant.value,
                  isDaily: mustViewModel.isDaily.value,
                );
                mustViewModel.isImportant.value = false;
                mustViewModel.isDaily.value = false;
                mustViewModel.loadMustBydate(mustViewModel.selectedDay.value);
                Get.back();
              }
            },
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "MUST 추가하기",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
