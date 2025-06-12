import 'package:icecream_crud_app/data/repository/i_repository.dart';
import 'package:isar/isar.dart';

abstract class BaseRepository<T> implements IRepository<T> {
  final Isar isar;

  BaseRepository(this.isar);

  IsarCollection<T> get collection;
}
