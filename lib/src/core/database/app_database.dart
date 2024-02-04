import 'package:drift/drift.dart';
import 'package:marvel_app/src/core/database/executor/db_executor_native.dart'
as connection;

part 'app_database.g.dart';

mixin class DatabaseHelper {
  // Объявите методы и свойства, которые должны быть доступны в AppDatabase
}

@DriftDatabase(include: {'tables/heroes_table.drift'})
class AppDatabase extends _$AppDatabase with DatabaseHelper {
  AppDatabase() : super(connection.openConnection());
  
  @override
  int get schemaVersion => 1;

}
