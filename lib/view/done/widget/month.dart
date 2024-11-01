import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pstyle/view_model/done_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class Month extends StatelessWidget {
  Month({super.key});
  final DoneViewModel _doneViewModel = Get.find<DoneViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TableCalendar(
        locale: 'ko_KR',
        focusedDay: _doneViewModel.focusDay.value,
        firstDay: DateTime.utc(2021, 1, 1),
        lastDay: DateTime.utc(2029, 12, 31),
        onDaySelected: (selectedDay, focusedDay) {
          _doneViewModel.focusDay.value = focusedDay;
          _doneViewModel.loadMustBydate(selectedDay);
        },
        selectedDayPredicate: (day) =>
            isSameDay(_doneViewModel.selectedDay.value, day),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        calendarStyle: const CalendarStyle(),
      ),
    );
  }
}
