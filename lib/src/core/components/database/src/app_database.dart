import 'package:marvel_app/src/core/components/database/src/executor/db_executor_native.dart'
as connection;
import 'package:drift/drift.dart';

part 'app_database.g.dart';



@DriftDatabase(include: {'tables/heroes_table.drift'})
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.openConnection());
  

  @override
  int get schemaVersion => 1;

}
