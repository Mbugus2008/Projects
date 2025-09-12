abstract class DataRepository {
  Future<void> create(Object data);
  Future<Object?> read(String id);
  Future<void> update(String id, Object newData);
  Future<void> delete(String id);
} 