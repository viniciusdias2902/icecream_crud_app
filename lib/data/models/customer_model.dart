import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:isar/isar.dart';

@Collection()
class CustomerModel {
  Id id = Isar.autoIncrement;
  late String customerName;
  final route = IsarLink<RouteModel>();
}
