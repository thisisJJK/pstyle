import 'package:get/state_manager.dart';

class DoneViewModel extends GetxController {
  var selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;

  var focusDay = DateTime.now().obs;

  void resetDate() {
    focusDay.value = DateTime.now();
    selectedDay.value = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
  }
}
