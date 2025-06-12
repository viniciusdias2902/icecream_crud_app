import 'package:isar/isar.dart';
import 'package:icecream_crud_app/data/models/sale_model.dart';

class SaleService {
  final Isar _isar;

  SaleService(this._isar);

  // Create
  Future<int> createSale(SaleModel sale) async {
    return await _isar.writeTxn(() async {
      return await _isar.saleModels.put(sale);
    });
  }

  Future<List<SaleModel>> getAllSales() async {
    return await _isar.saleModels.where().findAll();
  }

  Future<SaleModel?> getSaleById(int id) async {
    return await _isar.saleModels.get(id);
  }

  Future<bool> deleteSale(int id) async {
    return await _isar.writeTxn(() async {
      return await _isar.saleModels.delete(id);
    });
  }
}
