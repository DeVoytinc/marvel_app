import 'package:drift/drift.dart';
import 'package:marvel_app/src/core/database/app_database.dart';
import 'package:marvel_app/src/feature/home/data/data_source/marvel_storage_data_source.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';

abstract class MarvelStorageRepository {
  Future<void> saveHeroesToStorage(List<MarvelHero> heroes);
  Future<void> saveHeroToStorage(MarvelHero hero);
  Future<List<MarvelHero>> loadHeroesFromStorage();
}

class MarvelStorageRepositoryImpl extends MarvelStorageRepository {
  late final MarvelHeroDao marvelHeroDao;

  MarvelStorageRepositoryImpl(this.marvelHeroDao);

  @override
  Future<void> saveHeroesToStorage(List<MarvelHero> heroes) async {
    for (final hero in heroes) {
      await saveHeroToStorage(hero);
    }
  }

  @override
  Future<void> saveHeroToStorage(MarvelHero hero) async {
    final character = CharactersCompanion(
      id: Value(hero.id),
      name: Value(hero.name),
      description: Value(hero.description),
      imageUrl: Value(hero.imagePath),
    );
    await marvelHeroDao.saveCharacter(character);
  }

  @override
  Future<List<MarvelHero>> loadHeroesFromStorage() async {
    final characters = await marvelHeroDao.getAllCharacters();
    return characters.map(MarvelHero.fromData).toList();
  }
}
