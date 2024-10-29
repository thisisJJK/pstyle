import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:pstyle/view_model/main_page_view_model.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({super.key});
  final MainPageViewModel _mainPageViewModel = Get.find<MainPageViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            child: Obx(
              () => SizedBox(
                width: 65,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 222),
                  style: TextStyle(
                    fontSize: _mainPageViewModel.isMust.value ? 20 : 16,
                    fontWeight: _mainPageViewModel.isMust.value
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _mainPageViewModel.isMust.value
                        ? Theme.of(context).colorScheme.onSecondary
                        : Colors.black38,
                  ),
                  child: const Text(
                    'MUST',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            onPressed: () {
              if (_mainPageViewModel.isMust.value) null;
              if (!_mainPageViewModel.isMust.value) {
                _mainPageViewModel.isMust.value = true;
                _mainPageViewModel.isDone.value = false;
                _mainPageViewModel.pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 222),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),

          //추가
          FloatingActionButton.small(
            onPressed: () {
              _showAddTaskDialog(context);
            },
            child: const Icon(
              FeatherIcons.plus,
            ),
          ),
          TextButton(
            child: Obx(
              () => SizedBox(
                width: 65,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 222),
                  style: TextStyle(
                    fontSize: _mainPageViewModel.isDone.value ? 20 : 16,
                    fontWeight: _mainPageViewModel.isDone.value
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _mainPageViewModel.isDone.value
                        ? Theme.of(context).colorScheme.onSecondary
                        : Colors.black38,
                  ),
                  child: const Text(
                    'DONE',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            onPressed: () {
              if (_mainPageViewModel.isDone.value) null;
              if (!_mainPageViewModel.isDone.value) {
                _mainPageViewModel.isMust.value = false;
                _mainPageViewModel.isDone.value = true;
                _mainPageViewModel.pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 222),
                  curve: Curves.easeInOut,
                );
              }
            },
          )
        ],
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("MUST 추가"),
          content: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 할 일 제목 입력
                TextField(
                  onChanged: (value) =>
                      _mainPageViewModel.taskTitle.value = value,
                  decoration: const InputDecoration(labelText: "Task Title"),
                ),
                // 데드라인 시간
                TextField(
                  onChanged: (value) =>
                      _mainPageViewModel.deadlineTime.value = value,
                  decoration: const InputDecoration(labelText: "Dead line"),
                ),

                // 예상 소요 시간 입력
                TextField(
                  onChanged: (value) =>
                      _mainPageViewModel.estimatedTime.value = value,
                  decoration: const InputDecoration(
                    labelText: "예상소요시간",
                  ),
                ),
                // 중요 여부 체크박스
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: _mainPageViewModel.isImportant.value,
                      onChanged: (bool? value) {
                        _mainPageViewModel.isImportant.value = value ?? false;
                      },
                    ),
                    const Text('중요'),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("취소"),
            ),
            TextButton(
              onPressed: () {
                // 추가 작업 수행 (예: 할 일 저장)
                Navigator.pop(context);
              },
              child: const Text("추가"),
            ),
          ],
        );
      },
    );
  }
}
