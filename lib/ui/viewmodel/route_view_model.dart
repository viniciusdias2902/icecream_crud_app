import 'package:flutter/material.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:icecream_crud_app/data/repository/route_repository.dart';

class RouteViewModel extends ChangeNotifier {
  final RouteRepository _repository;
  List<RouteModel> _rotas = [];
  List<RouteModel> get rotas => _rotas;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _error;
  String? get error => _error;

  RouteViewModel(this._repository);

  Future<void> loadRotas() async {
    _isLoading = true;
    notifyListeners();
    try {
      _rotas = await _repository.getAll();
    } catch (e) {
      _error = 'Erro ao carregar rotas: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addRota(RouteModel rota) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _repository.add(rota);
      await loadRotas();
    } catch (e) {
      _error = 'Erro ao adicionar rota: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteRota(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _repository.delete(id);
      await loadRotas();
    } catch (e) {
      _error = 'Erro ao excluir rota: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
