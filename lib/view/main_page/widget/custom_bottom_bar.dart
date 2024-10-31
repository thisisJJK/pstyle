import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:pstyle/view_model/done_view_model.dart';
import 'package:pstyle/view_model/main_page_view_model.dart';
import 'package:pstyle/view_model/must_view_model.dart';

class CustomBottomBar extends StatelessWidget {
  final MainPageViewModel mainPageViewModel;
  final MustViewModel mustViewModel;
  final DoneViewModel doneViewModel;
  const CustomBottomBar({
    super.key,
    required this.mainPageViewModel,
    required this.mustViewModel,
    required this.doneViewModel,
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
    Get.bottomSheet(
      Container(
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
            Text(
              mustViewModel.getFormattedDate(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
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
                  width: 160,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '선택) 예상소요시간',
                      hintStyle: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) => true,
                ),
                const Text('중요'),
                Checkbox(
                  value: false,
                  onChanged: (value) => true,
                ),
                const Text('매일'),
              ],
            ),

            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
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
      ),
      isScrollControlled: true, // 시트를 전체 화면에 가깝게 띄우고 싶을 때 사용
      barrierColor: Colors.black.withOpacity(0.5), // 배경 반투명 효과
    );
  }
}
