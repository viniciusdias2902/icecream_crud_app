import 'package:flutter/material.dart';
import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:icecream_crud_app/data/repository/customer_repository.dart';
import 'package:icecream_crud_app/data/repository/route_repository.dart';

class CustomerViewModel extends ChangeNotifier {
  final CustomerRepository _customerRepository;
  final RouteRepository _routeRepository;

  CustomerViewModel(this._customerRepository, this._routeRepository) {
    loadCustomers();
    loadRoutes();
  }

  List<CustomerModel> _customers = [];
  List<CustomerModel> get customers => _customers;

  List<RouteModel> _routes = [];
  List<RouteModel> get routes => _routes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadCustomers() async {
    _isLoading = true;
    notifyListeners();

    try {
      _customers = await _customerRepository.getAll();
      for (var customer in _customers) {
        await customer.route.load();
      }
    } catch (e) {
      _error = 'Erro ao carregar clientes: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadRoutes() async {
    try {
      _routes = await _routeRepository.getAll();
      debugPrint('Rotas carregadas: ${_routes.length}');
      notifyListeners();
    } catch (e) {
      _error = 'Erro ao carregar rotas: $e';
      debugPrint('Erro ao carregar rotas: $e');
      notifyListeners();
    }
  }

  Future<void> addCustomer(CustomerModel customer, RouteModel? route) async {
    _isLoading = true;
    notifyListeners();

    try {
      if (route != null) {
        customer.route.value = route;
      }

      await _customerRepository.add(customer);
      await loadCustomers(); // Recarrega a lista após adicionar
    } catch (e) {
      _error = 'Erro ao adicionar cliente: $e';
      debugPrint('Erro ao adicionar cliente: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteCustomer(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _customerRepository.delete(id);
      await loadCustomers(); // Recarrega a lista após excluir
    } catch (e) {
      _error = 'Erro ao excluir cliente: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<CustomerModel> getCustomersByRoute(RouteModel route) {
    return _customers
        .where((customer) => customer.route.value?.id == route.id)
        .toList();
  }

  Map<String, int> getCustomerCountByRoute() {
    final countByRoute = <String, int>{};
    for (var customer in _customers) {
      if (customer.route.value != null) {
        final routeName = customer.route.value!.routeName;
        countByRoute[routeName] = (countByRoute[routeName] ?? 0) + 1;
      } else {
        countByRoute['Sem Rota'] = (countByRoute['Sem Rota'] ?? 0) + 1;
      }
    }
    return countByRoute;
  }
}
