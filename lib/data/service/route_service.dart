import 'package:isar/isar.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';

class RouteService {
  final Isar _isar;

  RouteService(this._isar);

  Future<int> addRoute(RouteModel route) async {
    return await _isar.writeTxn(() async {
      return await _isar.routeModels.put(route);
    });
  }

  Future<List<RouteModel>> getAllRoutes() async {
    return await _isar.routeModels.where().findAll();
  }

  Future<RouteModel?> getRouteById(int id) async {
    return await _isar.routeModels.get(id);
  }

  Future<bool> deleteRoute(int id) async {
    return await _isar.writeTxn(() async {
      final route = await _isar.routeModels.get(id);
      if (route != null) {
        await route.customers.load();
        for (final customer in route.customers) {
          customer.route.value = null;
          await customer.route.save();
        }
      }

      return await _isar.routeModels.delete(id);
    });
  }
}
