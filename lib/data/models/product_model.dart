import 'package:isar/isar.dart';
part 'product_model.g.dart';

@Collection()
class ProductModel {
  Id id = Isar.autoIncrement;
  late int unitValueInCents;
  late String productName;
}
