import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:icecream_crud_app/data/models/sale_model.dart';

class IsarDatabase {
  static Isar? _isar;

  static Future<Isar> get instance async {
    if (_isar != null) return _isar!;

    _isar = await _initializeIsar();
    return _isar!;
  }

  static Future<Isar> _initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();

    return await Isar.open([
      CustomerModelSchema,
      ProductModelSchema,
      RouteModelSchema,
      SaleModelSchema,
    ], directory: dir.path);
  }

  static Future<void> close() async {
    if (_isar != null) {
      await _isar!.close();
      _isar = null;
    }
  }
}
