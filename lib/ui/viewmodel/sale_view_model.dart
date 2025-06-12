import 'package:flutter/material.dart';
import 'package:icecream_crud_app/data/models/sale_model.dart';
import 'package:icecream_crud_app/data/repository/sale_repository.dart';

class VendasViewModel extends ChangeNotifier {
  final SaleRepository _repository;
  List<SaleModel> _vendas = [];
  List<SaleModel> get vendas => _vendas;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _error;
  String? get error => _error;

  VendasViewModel(this._repository);

  Future<void> loadVendas() async {
    _isLoading = true;
    notifyListeners();
    try {
      _vendas = await _repository.getAll();
    } catch (e) {
      _error = 'Erro ao carregar vendas: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addVenda(SaleModel venda) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _repository.add(venda);
      await loadVendas();
    } catch (e) {
      _error = 'Erro ao adicionar venda: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteVenda(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _repository.delete(id);
      await loadVendas();
    } catch (e) {
      _error = 'Erro ao excluir venda: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
