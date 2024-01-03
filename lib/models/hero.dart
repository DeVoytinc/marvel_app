import 'package:drift/drift.dart';
import 'package:marvel_app/data/db_manager.dart';

class MarvelHero {
  late String name;
  late String description;
  late String imagePath;

  MarvelHero(
  {
    required this.name, 
    required this.description, 
    required this.imagePath, 
  }
  );


  MarvelHero.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
    imagePath = json['thumbnail']['path'] + '.' + json['thumbnail']['extension'];
  }

  // Конвертирует объект MarvelHero в CharactersCompanion для вставки в базу данных.
  CharactersCompanion toCompanion() {
    return CharactersCompanion(
      name: Value(name),
      description: Value(description),
      imageUrl: Value(imagePath),
    );
  }

  // Создает объект MarvelHero из строки базы данных.
  static MarvelHero fromData(Character data) {
    return MarvelHero(
      name: data.name,
      description: data.description ?? '',
      imagePath: data.imageUrl ?? '',
    );
  }
}