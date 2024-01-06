import 'dart:io';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift_sqflite/drift_sqflite.dart';

part 'app_database.g.dart';

class Characters extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  TextColumn get imageUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Characters])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);
  

  @override
  int get schemaVersion => 1;

  Future<List<Character>> getAllCharacters() => select(characters).get();

  // Объединенный метод для сохранения персонажа
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
    await into(characters).insertOnConflictUpdate(character);
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

class DatabaseManager {
  static AppDatabase? _instance;

  static Future<AppDatabase> get database async {
    if (_instance != null) return _instance!;
    _instance = await _initDb();
    return _instance!;
  }

  static Future<AppDatabase> _initDb() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'marvel_characters.sqlite'));
    return AppDatabase(SqfliteQueryExecutor.inDatabaseFolder(path: file.path));
  }
}
