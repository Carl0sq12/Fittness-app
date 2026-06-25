import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../domain/entities/activity_record.dart';
import '../../domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  static Database? _db;
  static const String _tableName = 'activity_records';

  Future<Database> get _database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'fitness_tracker.db');

    return await openDatabase(
      path,
      version: 3, // ← subir a versión 3
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id                INTEGER PRIMARY KEY AUTOINCREMENT,
            activityType      TEXT    NOT NULL,
            steps             INTEGER NOT NULL DEFAULT 0,
            distanceKm        REAL    NOT NULL DEFAULT 0,
            calories          REAL    NOT NULL DEFAULT 0,
            durationSeconds   INTEGER NOT NULL DEFAULT 0,
            startedAt         TEXT    NOT NULL,
            endedAt           TEXT,
            notes             TEXT,
            fallCount         INTEGER NOT NULL DEFAULT 0,
            walkingSteps      INTEGER NOT NULL DEFAULT 0,
            runningSteps      INTEGER NOT NULL DEFAULT 0,
            stationarySeconds INTEGER NOT NULL DEFAULT 0
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            'ALTER TABLE $_tableName ADD COLUMN fallCount INTEGER NOT NULL DEFAULT 0',
          );
        }
        if (oldVersion < 3) {
          await db.execute(
            'ALTER TABLE $_tableName ADD COLUMN walkingSteps INTEGER NOT NULL DEFAULT 0',
          );
          await db.execute(
            'ALTER TABLE $_tableName ADD COLUMN runningSteps INTEGER NOT NULL DEFAULT 0',
          );
          await db.execute(
            'ALTER TABLE $_tableName ADD COLUMN stationarySeconds INTEGER NOT NULL DEFAULT 0',
          );
        }
      },
    );
  }

  @override
  Future<int> insert(ActivityRecord record) async {
    final db = await _database;
    return await db.insert(
      _tableName,
      record.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<ActivityRecord>> getAll() async {
    final db = await _database;
    final maps = await db.query(_tableName, orderBy: 'startedAt DESC');
    return maps.map((m) => ActivityRecord.fromMap(m)).toList();
  }

  @override
  Future<ActivityRecord?> getById(int id) async {
    final db = await _database;
    final maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return ActivityRecord.fromMap(maps.first);
  }

  @override
  Future<int> update(ActivityRecord record) async {
    final db = await _database;
    return await db.update(
      _tableName,
      record.toMap(),
      where: 'id = ?',
      whereArgs: [record.id],
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await _database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> deleteAll() async {
    final db = await _database;
    await db.delete(_tableName);
  }
}