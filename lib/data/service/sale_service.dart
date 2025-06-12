import 'package:isar/isar.dart';
import 'package:icecream_crud_app/data/models/sale_model.dart';

class SaleService {
  final Isar _isar;

  SaleService(this._isar);

  Future<int> addSale(SaleModel sale) async {
    return await _isar.writeTxn(() async {
      // Salvar a venda
      final saleId = await _isar.saleModels.put(sale);

      // Salvar os links relacionados
      await sale.product.save();
      await sale.customer.save();
      await sale.route.save();

      return saleId;
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
