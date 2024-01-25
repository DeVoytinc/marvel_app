

//import 'package:marvel_app/src/core/components/database/src/tables/heroes_table.dart';

import 'package:marvel_app/src/core/components/database/src/app_database.dart';

class MarvelHero {
  late int id;
  late String name;
  late String description;
  late String imagePath;

  MarvelHero(
  {
    required this.id,
    required this.name, 
    required this.description, 
    required this.imagePath, 
  }
  );



  MarvelHero.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imagePath = json['thumbnail']['path'] + '.' + json['thumbnail']['extension'];
  }


  // Создает объект MarvelHero из строки базы данных.
  static MarvelHero fromData(Character data) {
    return MarvelHero(
      id: data.id,
      name: data.name,
      description: data.description ?? '',
      imagePath: data.imageUrl, 
    );
  }
}