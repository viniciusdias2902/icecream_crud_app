import 'package:flutter/material.dart';

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({super.key});
  @override
  State<ChartsScreen> createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Gráficos'));
  }
}
