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
                  duration: const Duration(milliseconds: 333),
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
                  duration: const Duration(milliseconds: 333),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),

          //추가
          FloatingActionButton.small(
            onPressed: () {
              _showCustomBottomSheet();
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

  void _showCustomBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "This is a custom bottom sheet",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 하단 시트 닫기
                Get.back();
              },
              child: const Text("Close"),
            ),
          ],
        ),
      ),
      isScrollControlled: true, // 시트를 전체 화면에 가깝게 띄우고 싶을 때 사용
      barrierColor: Colors.black.withOpacity(0.5), // 배경 반투명 효과
    );
  }
}
