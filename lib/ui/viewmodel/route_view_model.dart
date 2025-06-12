import 'package:flutter/material.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:icecream_crud_app/data/repository/route_repository.dart';

class RouteViewModel extends ChangeNotifier {
  final RouteRepository _routeRepository;

  RouteViewModel(this._routeRepository) {
    loadRoutes();
  }

  List<RouteModel> _routes = [];
  List<RouteModel> get routes => _routes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadRoutes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _routes = await _routeRepository.getAll(); // Carrega as rotas
      for (var route in _routes) {
        await route.customers.load(); // Carrega os clientes
      }
    } catch (e) {
      _error = 'Erro ao carregar rotas: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); // Notifica que o estado foi alterado
    }
  }

  Future<void> addRoute(RouteModel route) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _routeRepository.add(route);
      await loadRoutes(); // Recarrega a lista após adicionar
    } catch (e) {
      _error = 'Erro ao adicionar rota: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteRoute(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _routeRepository.delete(id);
      await loadRoutes(); // Recarrega a lista após excluir
    } catch (e) {
      _error = 'Erro ao excluir rota: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  int getCustomerCount(RouteModel route) {
    return route.customers.length;
  }

  bool canDeleteRoute(RouteModel route) {
    return route.customers.isEmpty;
  }

  Map<String, dynamic> getRouteStatistics() {
    int totalRoutes = _routes.length;
    int totalCustomers = 0;
    int emptyRoutes = 0;

    for (var route in _routes) {
      int customerCount = route.customers.length;
      totalCustomers += customerCount;
      if (customerCount == 0) {
        emptyRoutes++;
      }
    }

    return {
      'totalRoutes': totalRoutes,
      'totalCustomers': totalCustomers,
      'emptyRoutes': emptyRoutes,
      'averageCustomersPerRoute': totalRoutes > 0
          ? (totalCustomers / totalRoutes).toStringAsFixed(1)
          : '0',
    };
  }
}
