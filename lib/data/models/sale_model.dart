import 'package:isar/isar.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:icecream_crud_app/data/models/customer_model.dart';
part 'sale_model.g.dart';

@Collection()
class SaleModel {
  Id id = Isar.autoIncrement;

  final product = IsarLink<ProductModel>();

  late int quantitySold;

  late int totalValueInCents;

  final DateTime saleDate = DateTime.now();

  final route = IsarLink<RouteModel>();

  final customer = IsarLink<CustomerModel>();
}
