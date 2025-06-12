import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icecream_crud_app/core/AppTheme.dart';

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
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
