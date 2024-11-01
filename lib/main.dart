import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pstyle/service/theme_service.dart';
import 'package:pstyle/view/splash/splash_view.dart';

void main() async {
  await initializeDateFormatting('ko_KR', '');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeService _themeService = Get.put(ThemeService());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pstyle',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: _themeService.isDarkMode.value
                ? Brightness.dark
                : Brightness.light,
          ),
          useMaterial3: true,
        ),
        home: const SplashView(),
      ),
    );
  }
}
