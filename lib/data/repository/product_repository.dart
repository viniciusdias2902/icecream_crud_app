import 'package:icecream_crud_app/data/models/product_model.dart';
import 'package:icecream_crud_app/data/repository/base_repository.dart';
import 'package:icecream_crud_app/data/service/product_service.dart';
import 'package:isar/isar.dart';

class ProductRepository extends BaseRepository<ProductModel> {
  final ProductService _productService;

  ProductRepository(Isar isar, this._productService) : super(isar);

  @override
  IsarCollection<ProductModel> get collection => isar.productModels;

  @override
  Future<int> add(ProductModel product) => _productService.addProduct(product);

  @override
  Future<List<ProductModel>> getAll() => _productService.getAllProducts();

  @override
  Future<ProductModel?> getById(int id) => _productService.getProductById(id);

  @override
  Future<bool> delete(int id) => _productService.deleteProduct(id);
}
