import 'data_repository.dart';

class MockDataRepository implements DataRepository {
  @override
  Future<void> create(Object data) async {
    // Simulate a network call to create data
    print('Creating data: $data');
  }

  @override
  Future<Object?> read(String id) async {
    // Simulate a network call to read data
    print('Reading data for ID: $id');
    return 'Data for $id';
  }

  @override
  Future<void> update(String id, Object newData) async {
    // Simulate a network call to update data
    print('Updating data for ID: $id with new data: $newData');
  }

  @override
  Future<void> delete(String id) async {
    // Simulate a network call to delete data
    print('Deleting data for ID: $id');
  }
} 