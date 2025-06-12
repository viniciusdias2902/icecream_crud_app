import 'package:isar/isar.dart';

@Collection()
class ProductModel {
  Id id = Isar.autoIncrement;
  late int unitValue;
  late String productName;
}
