import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:pstyle/model/must_item_model.dart';
import 'package:pstyle/service/database_service.dart';

class DoneViewModel extends GetxController {
 

  var focusDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;

 var allMust = <MustItemModel>[].obs;
  var filtedBydateMust = <MustItemModel>[].obs;
  var filtedByIsDoneMust = <MustItemModel>[].obs;

  final DatabaseService _databaseService = DatabaseService();

    @override
  void onInit() {
    loadMustBydate(selectedDay.value);
    super.onInit();
  }
  void loadMustBydate(DateTime date) async {
    selectedDay.value = date;
    await filterBydate();
    filterByIsDone();
  }

   Future<void> filterBydate() async {
    allMust.value = await _databaseService
        .databaseConfig()
        .then((value) => _databaseService.readAllMustItems());
    filtedBydateMust.value = allMust
        .where((task) =>
            (task.isDaily! &&
                task.deadline.year == selectedDay.value.year &&
                task.deadline.month == selectedDay.value.month &&
                task.deadline.day == selectedDay.value.day) ||
            (!task.isDaily! &&
                task.deadline.year == selectedDay.value.year &&
                task.deadline.month == selectedDay.value.month &&
                task.deadline.day == selectedDay.value.day))
        .toList();

    filtedBydateMust.sort((a, b) => a.deadline.compareTo(b.deadline));
  }

  void filterByIsDone() async {
    filtedByIsDoneMust.value = filtedBydateMust
        .where(
          (task) => task.isDone,
        )
        .toList();


  }

  void resetDate() {
    focusDay.value = DateTime.now();
    selectedDay.value = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
  }

   String deadlineFormattedTime(DateTime deadline) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, deadline.hour, deadline.minute);
    return '${DateFormat('HH:mm').format(dateTime)}까지';
  }
}
