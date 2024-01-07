import 'package:marvel_app/src/core/components/database/src/app_database.dart';
import 'package:marvel_app/src/core/router/router.dart';
import 'package:marvel_app/src/feature/home/data/heroes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marvel_app/src/feature/initialization/model/environment_store.dart';

part 'initialization_progress.freezed.dart';

@freezed
class RepositoriesStore with _$RepositoriesStore {
  const factory RepositoriesStore({
    required MarvelHeroesRepository marvelHeroesRepository,
  }) = _RepositoriesStore;
}

@freezed
class DependenciesStore with _$DependenciesStore {
  const factory DependenciesStore({
    required AppRouter router,
    required AppDatabase database,
  }) = _DependenciesStore;

  const DependenciesStore._();
}

@freezed
class InitializationProgress with _$InitializationProgress {
  const factory InitializationProgress({
    required IEnvironmentStore environment,
    AppRouter? router,
    MarvelHeroesRepository? marvelHeroesRepository,
    AppDatabase? database,
  }) = _InitializationProgress;

  const InitializationProgress._();

  DependenciesStore dependencies() => DependenciesStore(
        router: router!,
        database: database!,
      );

  RepositoriesStore repositories() => RepositoriesStore(
        marvelHeroesRepository: marvelHeroesRepository!,
      );
}

@freezed
class InitializationResult with _$InitializationResult {
  const factory InitializationResult({
    required DependenciesStore dependencies,
    required RepositoriesStore repositories,
    required int stepCount,
    required int msSpent,
  }) = _InitializationResult;
}

