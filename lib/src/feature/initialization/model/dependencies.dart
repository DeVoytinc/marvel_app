import 'package:marvel_app/src/core/database/app_database.dart';
import 'package:marvel_app/src/core/router/router.dart';
import 'package:marvel_app/src/feature/home/data/marvel_heroes_service.dart';
import 'package:marvel_app/src/feature/home/data/repository/marvel_api_repository.dart';

base class Dependencies {
  Dependencies();

  late final AppRouter route;

  late final AppDatabase db;

  late final MarvelApiRepository apiRepository;

  late final MarvelHeroesService heroesService;
}

final class InitializationResult {
  const InitializationResult({
    required this.dependencies,
  });

  final Dependencies dependencies;

  @override
  String toString() => '$InitializationResult('
      'dependencies: $dependencies'
      ')';
}