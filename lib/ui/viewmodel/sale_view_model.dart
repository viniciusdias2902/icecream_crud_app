import 'package:flutter/material.dart';
import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:icecream_crud_app/data/models/sale_model.dart';
import 'package:icecream_crud_app/data/repository/customer_repository.dart';
import 'package:icecream_crud_app/data/repository/product_repository.dart';
import 'package:icecream_crud_app/data/repository/route_repository.dart';
import 'package:icecream_crud_app/data/repository/sale_repository.dart';

class SalesViewModel extends ChangeNotifier {
  final SaleRepository _saleRepository;
  final ProductRepository _productRepository;
  final CustomerRepository _customerRepository;
  final RouteRepository _routeRepository;

  SalesViewModel(
    this._saleRepository,
    this._productRepository,
    this._customerRepository,
    this._routeRepository,
  ) {
    // Carregar dados iniciais
    loadSales();
    loadProducts();
    loadCustomers();
    loadRoutes();
  }

  List<SaleModel> _sales = [];
  List<SaleModel> get sales => _sales;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  List<CustomerModel> _customers = [];
  List<CustomerModel> get customers => _customers;

  List<RouteModel> _routes = [];
  List<RouteModel> get routes => _routes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadSales() async {
    _isLoading = true;
    notifyListeners();

    try {
      _sales = await _saleRepository.getAll();
      // Carregar os links relacionados para cada venda
      for (var sale in _sales) {
        await sale.product.load();
        await sale.customer.load();
        await sale.route.load();
      }
    } catch (e) {
      _error = 'Erro ao carregar vendas: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadProducts() async {
    try {
      _products = await _productRepository.getAll();
      notifyListeners();
    } catch (e) {
      _error = 'Erro ao carregar produtos: $e';
      notifyListeners();
    }
  }

  Future<void> loadCustomers() async {
    try {
      _customers = await _customerRepository.getAll();
      notifyListeners();
    } catch (e) {
      _error = 'Erro ao carregar clientes: $e';
      notifyListeners();
    }
  }

  Future<void> loadRoutes() async {
    try {
      _routes = await _routeRepository.getAll();
      notifyListeners();
    } catch (e) {
      _error = 'Erro ao carregar rotas: $e';
      notifyListeners();
    }
  }

  Future<void> addSale({
    required ProductModel product,
    required CustomerModel customer,
    required RouteModel route,
    required int quantity,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final sale = SaleModel()
        ..quantitySold = quantity
        ..totalValueInCents = product.unitValueInCents * quantity;

      // Configurar os links
      sale.product.value = product;
      sale.customer.value = customer;
      sale.route.value = route;

      await _saleRepository.add(sale);
      await loadSales(); // Recarrega a lista após adicionar
    } catch (e) {
      _error = 'Erro ao adicionar venda: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteSale(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _saleRepository.delete(id);
      await loadSales(); // Recarrega a lista após excluir
    } catch (e) {
      _error = 'Erro ao excluir venda: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Método auxiliar para calcular o total de vendas
  int get totalSalesValue {
    return _sales.fold(0, (sum, sale) => sum + sale.totalValueInCents);
  }

  // Método auxiliar para obter vendas por produto
  Map<String, int> getSalesByProduct() {
    final salesByProduct = <String, int>{};
    for (var sale in _sales) {
      if (sale.product.value != null) {
        final productName = sale.product.value!.productName;
        salesByProduct[productName] =
            (salesByProduct[productName] ?? 0) + sale.quantitySold;
      }
    }
    return salesByProduct;
  }
}
