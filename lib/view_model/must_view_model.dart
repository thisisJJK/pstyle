import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:pstyle/model/must_item_model.dart';
import 'package:pstyle/service/database_service.dart';

class MustViewModel extends GetxController {
  var isDoneChecked = false.obs;
  var selectedDay = DateTime.now().obs;
  var focusDay = DateTime.now().obs;

  var allMust = <MustItemModel>[].obs;
  var filtedBydateMust = <MustItemModel>[].obs;

  var deadlineTime = DateTime.now().obs;
  var estimatedTime = 0.obs;
  var isImportant = false.obs;
  var isDaily = false.obs;

  final DatabaseService _databaseService = DatabaseService();

  @override
  void onInit() {
    loadMustBydate(selectedDay.value);
    super.onInit();
  }

  void loadMustBydate(DateTime date) {
    selectedDay.value = date;
    filterBydate();
  }

  void filterBydate() async {
    allMust.value = await _databaseService
        .databaseConfig()
        .then((value) => _databaseService.readAllMustItems());
    filtedBydateMust.value = allMust
        .where(
          (task) =>
              task.isDaily! ||
              task.deadline.year == selectedDay.value.year &&
                  task.deadline.month == selectedDay.value.month &&
                  task.deadline.day == selectedDay.value.day,
        )
        .toList();
  }

  //완료여부 업데이트
  void toggleDone(int id) async {
    int taskIndex = allMust.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      allMust[taskIndex].isDone = !allMust[taskIndex].isDone;
      allMust.refresh(); // allMust 새로고침
      await _databaseService.databaseConfig().then(
            (value) => _databaseService.updateMustItem(allMust[taskIndex]),
          );
      filterBydate(); // 필터링 목록 업데이트
    }
  }

  //추가
  Future<void> addMustItem(
    String title,
    DateTime deadline, {
    int? estimatedTime,
    bool isImportant = false,
    bool isDaily = false,
  }) async {
    final newTask = MustItemModel(
      title: title,
      deadline: deadline,
      estimatedTime: estimatedTime,
      isImportant: isImportant,
      isDaily: isDaily,
    );

    // 데이터베이스에 저장
    final id = await _databaseService.databaseConfig().then(
          (value) => _databaseService.createMustItem(newTask),
        );

    // 새로 생성된 ID를 할 일 항목에 할당하고 메모리 목록에 추가
    allMust.add(newTask.copyWith(id: id));
    allMust.refresh(); // 추가 후 목록 업데이트
  }

  //예상소요시간
  void setEstimatedTime(String estimatedTimeText) {
    if (estimatedTimeText.isEmpty) return;
    estimatedTime.value = int.parse(estimatedTimeText);
  }

  //데드라인 설정
  void setDeadline(String hourText, String minuteText) {
    if (hourText.isEmpty || minuteText.isEmpty) return;
    final hour = int.parse(hourText);
    final minute = int.parse(minuteText);
    deadlineTime.value = DateTime(selectedDay.value.year,
        selectedDay.value.month, selectedDay.value.day, hour, minute);
  }

  String deadlineFormattedTime(DateTime deadline) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, deadline.hour, deadline.minute);
    return '${DateFormat('HH:mm').format(dateTime)}까지';
  }

  String getFormattedDate() {
    DateTime now = focusDay.value;
    String dayOfWeek = DateFormat('E', 'ko_KR').format(now); // 요일 가져오기
    return '${DateFormat('yyyy.MM.dd').format(now)} ($dayOfWeek)';
  }

  void resetDate() {
    focusDay.value = DateTime.now();
    selectedDay.value = DateTime.now();
  }
}
