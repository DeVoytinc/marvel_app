import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:marvel_app/src/core/components/database/src/app_database.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'marvel_storage_data_source.g.dart';

// Service для работы с базой данных
// class MarvelStorageDataSource {
//   Future<List<MarvelHero>> loadHeroesFromStorage() async {
//     final db = await DatabaseManager.database;
//     final characters = await db.getAllCharacters();
//     List<MarvelHero> heroes = characters.map(MarvelHero.fromData).toList();
//     return heroes;
//   }
// }

abstract class MarvelStorageDataSource {
  Future<List<Character>> getAllCharacters();

  Future<void> saveCharacter(MarvelHero hero);

  Future<List<MarvelHero>> loadHeroesFromStorage();
}

@DriftAccessor(tables: [Characters])
class MarvelHeroDao extends DatabaseAccessor<AppDatabase>
    with _$MarvelHeroDaoMixin
    implements MarvelStorageDataSource {
  MarvelHeroDao(super.attachedDatabase);

  @override
  Future<List<Character>> getAllCharacters() =>  select(attachedDatabase.characters).get();

  @override
  Future<List<MarvelHero>> loadHeroesFromStorage() async {
    final characters = await getAllCharacters();
    List<MarvelHero> heroes = characters.map(MarvelHero.fromData).toList();
    return heroes;
  }

  @override
  Future<void> saveCharacter(MarvelHero hero) async {
    String localImagePath =
        await downloadAndSaveImage(hero.imagePath, 'hero_${hero.name}.jpg');

    // Если персонажа нет, сохраняем его как нового
    final character = CharactersCompanion(
      id: Value(hero.id),
      name: Value(hero.name),
      description: Value(hero.description),
      imageUrl: Value(localImagePath),
    );
    await into(attachedDatabase.characters).insertOnConflictUpdate(character);
  }

  Future<String> downloadAndSaveImage(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = p.join(directory.path, fileName);

    Dio dio = Dio();
    final response = await dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    final file = File(filePath);
    await file.writeAsBytes(response.data);

    return filePath;
  }
}