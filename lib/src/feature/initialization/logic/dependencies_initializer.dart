import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:marvel_app/firebase_options.dart';
import 'package:marvel_app/src/core/database/app_database.dart';
import 'package:marvel_app/src/core/router/router.dart';
import 'package:marvel_app/src/feature/home/data/data_source/marvel_api_data_source.dart';
import 'package:marvel_app/src/feature/home/data/data_source/marvel_storage_data_source.dart';
import 'package:marvel_app/src/feature/home/data/marvel_heroes_service.dart';
import 'package:marvel_app/src/feature/home/data/repository/marvel_api_repository.dart';
import 'package:marvel_app/src/feature/home/data/repository/marvel_storage_repository.dart';
import 'package:marvel_app/src/feature/initialization/model/dependencies.dart';

class DependenciesInitializer {
  static Future<Dependencies> initializeDependencies() async {
    final dependencies = Dependencies();

    //Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseMessaging.instance.requestPermission(provisional: true);
    await FirebaseMessaging.instance.getAPNSToken();

    //Router
    dependencies.route = AppRouter();

    //Database
    dependencies.db = AppDatabase();

    //MarvelHeroesService
    final apiRep = MarvelApiRepositoryImpl(MarvelApiDataSourceImpl());
    final storageRep = MarvelStorageRepositoryImpl(
      MarvelHeroDao(dependencies.db),
    );
    dependencies.heroesService = MarvelHeroesServiceImpl(apiRep, storageRep);

    return dependencies;
  }
}
