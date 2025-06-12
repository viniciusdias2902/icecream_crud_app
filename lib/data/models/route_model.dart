import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:isar/isar.dart';

@Collection()
class RouteModel {
  Id id = Isar.autoIncrement;
  late String routeName;
  final customers = IsarLinks<CustomerModel>();
}
