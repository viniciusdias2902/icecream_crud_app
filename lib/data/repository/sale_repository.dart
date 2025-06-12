import 'package:icecream_crud_app/data/models/sale_model.dart';
import 'package:icecream_crud_app/data/repository/base_repository.dart';
import 'package:icecream_crud_app/data/service/sale_service.dart';
import 'package:isar/isar.dart';

class SaleRepository extends BaseRepository<SaleModel> {
  final SaleService _saleService;

  SaleRepository(Isar isar, this._saleService) : super(isar);

  @override
  IsarCollection<SaleModel> get collection => isar.saleModels;

  // Delegando para o service
  @override
  Future<int> add(SaleModel sale) => _saleService.addSale(sale);

  @override
  Future<List<SaleModel>> getAll() => _saleService.getAllSales();

  @override
  Future<SaleModel?> getById(int id) => _saleService.getSaleById(id);

  @override
  Future<bool> delete(int id) => _saleService.deleteSale(id);
}
