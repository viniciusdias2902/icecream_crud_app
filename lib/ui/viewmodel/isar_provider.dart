import 'package:flutter/material.dart';
import 'package:icecream_crud_app/data/database/isar_database.dart';
import 'package:isar/isar.dart';

class IsarProvider extends ChangeNotifier {
  Isar? _isar;
  bool _isInitialized = false;
  bool _isLoading = false;
  String? _error;

  // Getters
  Isar? get isar => _isar;
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Inicializa o Isar
  Future<void> initialize() async {
    if (_isInitialized) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _isar = await IsarService.instance;
      _isInitialized = true;
    } catch (e) {
      _error = 'Erro ao inicializar banco de dados: $e';
      debugPrint(_error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fecha o Isar
  Future<void> close() async {
    await IsarDatabase.close();
    _isar = null;
    _isInitialized = false;
    notifyListeners();
  }

  @override
  void dispose() {
    close();
    super.dispose();
  }
}
