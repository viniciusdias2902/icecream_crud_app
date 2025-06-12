import 'package:flutter/material.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';
import 'package:icecream_crud_app/data/repository/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductViewModel(this._productRepository);

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _productRepository.getAll();
    } catch (e) {
      _error = 'Erro ao carregar produtos: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(ProductModel product) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _productRepository.add(product);
      await loadProducts(); // Recarrega a lista após adicionar
    } catch (e) {
      _error = 'Erro ao adicionar produto: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _productRepository.delete(id);
      await loadProducts(); // Recarrega a lista após excluir
    } catch (e) {
      _error = 'Erro ao excluir produto: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
