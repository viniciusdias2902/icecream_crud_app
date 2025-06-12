import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icecream_crud_app/ui/view/pages/charts_screen.dart';
import 'package:icecream_crud_app/ui/view/pages/products_screen.dart';
import 'package:icecream_crud_app/ui/view/pages/sale_screen.dart'; // Importar a tela de Produtos

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ChartsScreen(),
    const SalesScreen(),
    const Center(child: Text('Clientes')),
    const ProductsScreen(),
    const Center(child: Text('Rotas')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Max Bono',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Gráficos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale),
            label: 'Vendas',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Clientes'),
          BottomNavigationBarItem(
            icon: Icon(Icons.icecream),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Rotas'),
        ],
      ),
    );
  }
}
