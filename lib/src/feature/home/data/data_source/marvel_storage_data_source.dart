import 'package:marvel_app/src/core/components/database/src/app_database.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';

// Service для работы с базой данных
class MarvelStorageDataSource {
  Future<List<MarvelHero>> loadHeroesFromStorage() async {
    final db = await DatabaseManager.database;
    final characters = await db.getAllCharacters();
    List<MarvelHero> heroes = characters.map(MarvelHero.fromData).toList();
    return heroes;
  }
}