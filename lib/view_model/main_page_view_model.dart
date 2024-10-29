import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageViewModel extends GetxController {
  var pageIndex = 0.obs;
  var isMust = true.obs;
  var isDone = false.obs;

  var taskTitle = ''.obs;
  var deadlineDate = DateTime.now().obs;
  var deadlineTime = ''.obs;
  var isImportant = false.obs;
  var estimatedTime = ''.obs;

  final PageController pageController = Get.put(PageController());
}
