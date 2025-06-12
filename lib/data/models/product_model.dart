import 'package:isar/isar.dart';

@Collection()
class ProductModel {
  Id id = Isar.autoIncrement;
  late int unitValueInCents;
  late String productName;
}
