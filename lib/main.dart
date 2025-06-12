import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffdd7878),
          primary: const Color(0xffdd7878),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
