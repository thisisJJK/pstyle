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
    return Obx(() {
      _doneViewModel.loadMustBydate(_doneViewModel.selectedDay.value);

      return TableCalendar(
        locale: 'ko_KR',
        rowHeight: 50,
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
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(),
          markerDecoration: BoxDecoration(
            color: Colors.green.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
        ),
        eventLoader: (day) {
          final dateOnly = DateTime(day.year, day.month, day.day);
          return _doneViewModel.completedCount.containsKey(dateOnly) &&
                  _doneViewModel.completedCount[dateOnly]! > 0
              ? [true]
              : [];
        },
        calendarBuilders: CalendarBuilders(
          todayBuilder: (context, day, focusedDay) {
            return Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.6),
              ),
              child: Align(
                alignment: const Alignment(0, -0.6),
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            );
          },
          selectedBuilder: (context, day, focusedDay) {
            return Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              child: Align(
                alignment: const Alignment(0, -0.6),
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
