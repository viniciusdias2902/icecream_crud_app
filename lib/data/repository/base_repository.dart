import 'package:icecream_crud_app/data/repository/i_repository.dart';
import 'package:isar/isar.dart';

abstract class BaseRepository<T> implements IRepository<T> {
  final Isar isar;

  BaseRepository(this.isar);

  IsarCollection<T> get collection;

  @override
  Future<int> update(T item) => add(item);

  @override
  Stream<List<T>> watchAll() {
    return collection.where().watch(fireImmediately: true);
  }

  @override
  Stream<T?> watchById(int id) {
    return collection.watchObject(id, fireImmediately: true);
  }
}
