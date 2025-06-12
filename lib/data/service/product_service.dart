import 'package:isar/isar.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';

class ProductService {
  final Isar _isar;

  ProductService(this._isar);

  Future<int> addProduct(ProductModel product) async {
    return await _isar.writeTxn(() async {
      return await _isar.productModels.put(product);
    });
  }

  Future<List<ProductModel>> getAllProducts() async {
    return await _isar.productModels.where().findAll();
  }

  Future<ProductModel?> getProductById(int id) async {
    return await _isar.productModels.get(id);
  }

  Future<bool> deleteProduct(int id) async {
    return await _isar.writeTxn(() async {
      return await _isar.productModels.delete(id);
    });
  }
}
