import 'package:drift/drift.dart';

class MarvelHeroes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get imagePath => text()();
}

