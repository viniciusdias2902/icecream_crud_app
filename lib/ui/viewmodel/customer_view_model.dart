import 'package:flutter/material.dart';
import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:icecream_crud_app/data/repository/customer_repository.dart';

class CustomerViewModel extends ChangeNotifier {
  final CustomerRepository _repository;
  List<CustomerModel> _clientes = [];
  List<CustomerModel> get clientes => _clientes;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _error;
  String? get error => _error;

  CustomerViewModel(this._repository);

  Future<void> loadClientes() async {
    _isLoading = true;
    notifyListeners();
    try {
      _clientes = await _repository.getAll();
    } catch (e) {
      _error = 'Erro ao carregar clientes: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addCliente(CustomerModel cliente) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _repository.add(cliente);
      await loadClientes();
    } catch (e) {
      _error = 'Erro ao adicionar cliente: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteCliente(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _repository.delete(id);
      await loadClientes();
    } catch (e) {
      _error = 'Erro ao excluir cliente: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
