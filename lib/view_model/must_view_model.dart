import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class MustViewModel extends GetxController {
  var isDoneChecked = false.obs;
  var selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;

  var focusDay = DateTime.now().obs;

  String getFormattedDate() {
    DateTime now = focusDay.value;
    String dayOfWeek = DateFormat('E', 'ko_KR').format(now); // 요일 가져오기
    return '${DateFormat('yyyy.MM.dd').format(now)} ($dayOfWeek)';
  }

  void resetDate() {
    focusDay.value = DateTime.now();
    selectedDay.value = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
  }
}
