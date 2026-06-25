import '../entities/activity_record.dart';

abstract class ActivityRepository {
  Future<int> insert(ActivityRecord record);
  Future<List<ActivityRecord>> getAll();
  Future<ActivityRecord?> getById(int id);
  Future<int> update(ActivityRecord record);
  Future<int> delete(int id);
  Future<void> deleteAll();
}