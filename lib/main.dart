import 'package:flutter/material.dart';
import 'package:icecream_crud_app/core/app_theme.dart';
import 'package:icecream_crud_app/ui/view/pages/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
