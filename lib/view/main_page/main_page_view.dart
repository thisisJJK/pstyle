import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pstyle/view/done/done_view.dart';
import 'package:pstyle/view/main_page/widget/custom_bottom_bar.dart';
import 'package:pstyle/view/must/must_view.dart';
import 'package:pstyle/view_model/done_view_model.dart';
import 'package:pstyle/view_model/main_page_view_model.dart';
import 'package:pstyle/view_model/must_view_model.dart';

class MainPageView extends StatelessWidget {
  MainPageView({super.key});
  final MainPageViewModel _mainPageViewModel = Get.put(MainPageViewModel());
  final MustViewModel _mustViewModel = Get.put(MustViewModel());
  final DoneViewModel _doneViewModel = Get.put(DoneViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _mainPageViewModel.pageController,
        onPageChanged: (index) {
          _mainPageViewModel.pageIndex.value = index;
          if (index == 0) {
            _mainPageViewModel.isMust.value = true;
            _mainPageViewModel.isDone.value = false;
            _mustViewModel.resetDate();
            _doneViewModel.resetDate();
          }
          if (index == 1) {
            _mainPageViewModel.isDone.value = true;
            _mainPageViewModel.isMust.value = false;
            _mustViewModel.resetDate();
            _doneViewModel.resetDate();
          }
        },
        children: [
          const MustView(),
          DoneView(),
        ],
      ),
      floatingActionButton: CustomBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
