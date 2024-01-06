import 'dart:async';

import 'package:marvel_app/src/core/components/database/src/app_database.dart';
import 'package:marvel_app/src/core/router/router.dart';
import 'package:marvel_app/src/feature/home/data/heroes_repository.dart';
import 'package:marvel_app/src/feature/home/data/data_source/marvel_api_data_source.dart';
import 'package:marvel_app/src/feature/home/data/data_source/marvel_storage_data_source.dart';
import 'package:marvel_app/src/feature/initialization/model/initialization_progress.dart';

typedef StepAction = FutureOr<InitializationProgress>? Function(
  InitializationProgress progress,
);
mixin InitializationSteps {
  final initializationSteps = <String, StepAction>{
    ..._dependencies,
    ..._data,
  };
  static final _dependencies = <String, StepAction>{
    'Init Router': (progress) {
      final router = AppRouter();
      return progress.copyWith(
        router: router,
      );
    },
    'Init Drift Database': (progress) async {
      final marvelDatabase = await DatabaseManager.database;
      return progress.copyWith(
        database: marvelDatabase,
      );
    }
  };
  static final _data = <String, StepAction>{
    'Init Marvel Heroes Repository': (progress) {
      final marvelHeroesRepository = MarvelHeroesRepositoryImpl(
        apiDataSource: MarvelApiDataSource(), 
        storageDataSource: MarvelStorageDataSource(),
      );
      return progress.copyWith(
        marvelHeroesRepository: marvelHeroesRepository,
      );
    },
  };
}
