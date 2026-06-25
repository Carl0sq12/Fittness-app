import 'package:get_it/get_it.dart';
import 'features/activity/data/datasources/activity_datasource_impl.dart';
import 'features/activity/data/services/tts_service.dart';
import 'features/activity/presentation/bloc/activity_bloc.dart';
import 'features/auth/data/datasources/accelerometer_datasource.dart';
import 'features/auth/tracking/data/datasources/gps_datasource.dart';
import 'features/history/data/repositories/activity_repository_impl.dart';
import 'features/history/domain/repositories/activity_repository.dart';
import 'features/history/presentation/bloc/history_bloc.dart';

final sl = GetIt.instance;

void initDependencies() {
  // ── Servicios ────────────────────────────────────────────────────
  sl.registerLazySingleton<TtsService>(() => TtsService());

  // ── Datasources ──────────────────────────────────────────────────
  sl.registerLazySingleton<AccelerometerDataSource>(
    () => AccelerometerDataSourceImpl(),
  );
  sl.registerLazySingleton<GpsDataSource>(
    () => GpsDataSourceImpl(),
  );
  sl.registerLazySingleton<ActivityDataSourceImpl>(
    () => ActivityDataSourceImpl(sl<AccelerometerDataSource>()),
  );

  // ── Repositorio CRUD ─────────────────────────────────────────────
  sl.registerLazySingleton<ActivityRepository>(
    () => ActivityRepositoryImpl(),
  );

  // ── BLoCs ────────────────────────────────────────────────────────
  sl.registerFactory<ActivityBloc>(
    () => ActivityBloc(
      dataSource: sl<ActivityDataSourceImpl>(),
      ttsService: sl<TtsService>(),
      repository: sl<ActivityRepository>(), // ← línea añadida
    ),
  );

  sl.registerFactory<HistoryBloc>(
    () => HistoryBloc(sl<ActivityRepository>()),
  );
}