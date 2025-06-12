abstract class IRepository<T> {
  Future<int> add(T item);
  Future<List<T>> getAll();
  Future<T?> getById(int id);
  Future<bool> delete(int id);
}
