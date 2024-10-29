import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pstyle/view/main_page/main_page_view.dart';

void main() async {
  await initializeDateFormatting('ko_KR', '');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pstyle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: MainPageView(),
    );
  }
}
