import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Widgets> _screens = [
    const DashBoardScreen(),
    const Center(child: Text('Vendas')),
    const Center(child: Text('Clientes')),
    const Center(child: Text('Produtos')),
    const Center(child: Text('Rotas')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
