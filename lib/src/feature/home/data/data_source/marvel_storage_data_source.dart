import 'package:drift/drift.dart';
import 'package:marvel_app/src/core/database/app_database.dart';

part 'marvel_storage_data_source.g.dart';

abstract class MarvelStorageDataSource {
  Future<List<Character>> getAllCharacters();

  Future<void> saveCharacter(CharactersCompanion character);
}

@DriftAccessor(tables: [Characters])
class MarvelHeroDao extends DatabaseAccessor<AppDatabase>
    with _$MarvelHeroDaoMixin
    implements MarvelStorageDataSource {
  MarvelHeroDao(super.attachedDatabase);

  @override
  Future<List<Character>> getAllCharacters() =>
      select(attachedDatabase.characters).get();

  @override
  Future<void> saveCharacter(CharactersCompanion character) =>
        into(attachedDatabase.characters).insertOnConflictUpdate(character);
}
