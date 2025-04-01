import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/theme/theme.dart';

// Light and dark theme

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}