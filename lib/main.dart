import 'package:flutter/material.dart';
import 'package:icecream_crud_app/ui/viewmodel/isar_provider.dart';
import 'package:icecream_crud_app/ui/viewmodel/product_view_model.dart';
import 'package:icecream_crud_app/ui/viewmodel/sale_view_model.dart';
import 'package:provider/provider.dart';
import 'package:icecream_crud_app/ui/view/pages/home_screen.dart';
import 'package:icecream_crud_app/data/repository/product_repository.dart';
import 'package:icecream_crud_app/data/repository/sale_repository.dart';
import 'package:icecream_crud_app/data/repository/customer_repository.dart';
import 'package:icecream_crud_app/data/repository/route_repository.dart';
import 'package:icecream_crud_app/data/service/product_service.dart';
import 'package:icecream_crud_app/data/service/sale_service.dart';
import 'package:icecream_crud_app/data/service/customer_service.dart';
import 'package:icecream_crud_app/data/service/route_service.dart';
import 'package:icecream_crud_app/core/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IsarProvider()..initialize(),
      child: Consumer<IsarProvider>(
        builder: (context, isarProvider, child) {
          if (!isarProvider.isInitialized) {
            return const MaterialApp(
              home: Scaffold(body: Center(child: CircularProgressIndicator())),
            );
          }

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ProductViewModel(
                  ProductRepository(
                    isarProvider.isar!,
                    ProductService(isarProvider.isar!),
                  ),
                ),
              ),
              ChangeNotifierProvider(
                create: (_) => SalesViewModel(
                  SaleRepository(
                    isarProvider.isar!,
                    SaleService(isarProvider.isar!),
                  ),
                  ProductRepository(
                    isarProvider.isar!,
                    ProductService(isarProvider.isar!),
                  ),
                  CustomerRepository(
                    isarProvider.isar!,
                    CustomerService(isarProvider.isar!),
                  ),
                  RouteRepository(
                    isarProvider.isar!,
                    RouteService(isarProvider.isar!),
                  ),
                ),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: ThemeMode.system,
              home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
