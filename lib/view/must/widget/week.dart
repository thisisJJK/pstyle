import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pstyle/service/theme_service.dart';
import 'package:pstyle/view_model/must_view_model.dart';
import 'package:table_calendar/table_calendar.dart';

class Week extends StatelessWidget {
  Week({super.key});

  final MustViewModel _mustViewModel = Get.find<MustViewModel>();
  final ThemeService _themeService = Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //헤더부분
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                '${_mustViewModel.focusDay.value.year}년 ${_mustViewModel.focusDay.value.month}월',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                _mustViewModel.resetDate();
                _mustViewModel.loadMustBydate(_mustViewModel.focusDay.value);
              },
              child: Container(
                height: 30,
                width: 45,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    '오늘',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => IconButton(
                onPressed: () {
                  _themeService.toggleTheme();
                },
                icon: _themeService.isDarkMode.value
                    ? const Icon(
                        FeatherIcons.moon,
                      )
                    : const Icon(FeatherIcons.sun),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        //달력부분
        Obx(
          () => TableCalendar(
            locale: 'ko_KR',
            headerVisible: false,
            calendarFormat: CalendarFormat.twoWeeks,
            focusedDay: _mustViewModel.focusDay.value,
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2029, 12, 31),
            onDaySelected: (selectedDay, focusedDay) {
              _mustViewModel.focusDay.value = focusedDay;
              _mustViewModel.loadMustBydate(selectedDay);
            },
            selectedDayPredicate: (day) =>
                isSameDay(_mustViewModel.selectedDay.value, day),
            calendarStyle: CalendarStyle(
              todayTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
