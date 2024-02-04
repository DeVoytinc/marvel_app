import 'package:marvel_app/src/core/database/app_database.dart';

class MarvelHero {
  final int id;
  final String name;
  final String description;
  final String imagePath;

  const MarvelHero({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
  });

  factory MarvelHero.fromJson(Map<String, dynamic> json) => MarvelHero(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        imagePath: "${json['thumbnail']['path']}",
      );

  factory MarvelHero.fromData(Character data) => MarvelHero(
        id: data.id,
        name: data.name,
        description: data.description ?? '',
        imagePath: data.imageUrl,
      );
}
