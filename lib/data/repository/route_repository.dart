import 'package:icecream_crud_app/data/models/route_model.dart';
import 'package:icecream_crud_app/data/repository/base_repository.dart';
import 'package:icecream_crud_app/data/service/route_service.dart';
import 'package:isar/isar.dart';

class RouteRepository extends BaseRepository<RouteModel> {
  final RouteService _routeService;

  RouteRepository(Isar isar, this._routeService) : super(isar);

  @override
  IsarCollection<RouteModel> get collection => isar.routeModels;

  @override
  Future<int> add(RouteModel route) => _routeService.addRoute(route);

  @override
  Future<List<RouteModel>> getAll() => _routeService.getAllRoutes();

  @override
  Future<RouteModel?> getById(int id) => _routeService.getRouteById(id);

  @override
  Future<bool> delete(int id) => _routeService.deleteRoute(id);
}
