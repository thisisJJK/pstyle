import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:pstyle/view/main_page/widget/must_bottom_sheet.dart';
import 'package:pstyle/view_model/main_page_view_model.dart';
import 'package:pstyle/view_model/must_view_model.dart';

class CustomBottomBar extends StatelessWidget {
  final MainPageViewModel mainPageViewModel;
  final MustViewModel mustViewModel;

  const CustomBottomBar({
    super.key,
    required this.mainPageViewModel,
    required this.mustViewModel,
  });

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
                  duration: const Duration(milliseconds: 333),
                  style: TextStyle(
                    fontSize: mainPageViewModel.isMust.value ? 20 : 16,
                    fontWeight: mainPageViewModel.isMust.value
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: mainPageViewModel.isMust.value
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
              if (mainPageViewModel.isMust.value) null;
              if (!mainPageViewModel.isMust.value) {
                mainPageViewModel.isMust.value = true;
                mainPageViewModel.isDone.value = false;
                mainPageViewModel.pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 333),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),

          //추가
          FloatingActionButton.small(
            onPressed: () {
              _showCustomBottomSheet(context);
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
                  duration: const Duration(milliseconds: 333),
                  style: TextStyle(
                    fontSize: mainPageViewModel.isDone.value ? 20 : 16,
                    fontWeight: mainPageViewModel.isDone.value
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: mainPageViewModel.isDone.value
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
              if (mainPageViewModel.isDone.value) null;
              if (!mainPageViewModel.isDone.value) {
                mainPageViewModel.isMust.value = false;
                mainPageViewModel.isDone.value = true;
                mainPageViewModel.pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 333),
                  curve: Curves.easeInOut,
                );
              }
            },
          )
        ],
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController estimatedTimeController =
        TextEditingController();
    final TextEditingController hourController = TextEditingController();
    final TextEditingController minController = TextEditingController();

    Get.bottomSheet(
      MustBottomSheet(
        mustViewModel: mustViewModel,
        titleController: titleController,
        hourController: hourController,
        minController: minController,
        estimatedTimeController: estimatedTimeController,
      ),
      isScrollControlled: true, // 시트를 전체 화면에 가깝게 띄우고 싶을 때 사용
      barrierColor: Colors.black.withOpacity(0.5), // 배경 반투명 효과
    );
  }
}
