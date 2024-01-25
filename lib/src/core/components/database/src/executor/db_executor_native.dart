import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

QueryExecutor openConnection() => LazyDatabase(
  () async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'marvel_characters.sqlite'));
    return SqfliteQueryExecutor.inDatabaseFolder(path: file.path);
  }
);


