import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:icecream_crud_app/data/models/sale_model.dart';

class IsarDatabase {
  static Isar? _instance;

  static Future<Isar> get instance async {
    if (_instance != null && _instance!.isOpen) {
      return _instance!;
    }

    _instance = await _openIsar();
    return _instance!;
  }

  static Future<Isar> _openIsar() async {
    final dir = await getApplicationDocumentsDirectory();

    return await Isar.open(
      [
        CustomerModelSchema,
        ProductModelSchema,
        RouteModelSchema,
        SaleModelSchema,
      ],
      directory: dir.path,
      inspector: kDebugMode, // Ativa o inspector em modo debug
    );
  }

  static Future<void> close() async {
    if (_instance != null && _instance!.isOpen) {
      await _instance!.close();
      _instance = null;
    }
  }
}
