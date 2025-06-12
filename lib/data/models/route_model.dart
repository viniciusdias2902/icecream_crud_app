import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:isar/isar.dart';
part 'route_model.g.dart';

@Collection()
class RouteModel {
  Id id = Isar.autoIncrement;
  late String routeName;
  final customers = IsarLinks<CustomerModel>();
}
