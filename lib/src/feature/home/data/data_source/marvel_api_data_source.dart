import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marvel_app/src/core/constants/api.dart';
import 'package:marvel_app/src/feature/home/data/image_downloader.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';

abstract class MarvelApiDataSource {
  Future<List<MarvelHero>> fetchHeroesFromApi(); 
}

class MarvelApiDataSourceImpl extends MarvelApiDataSource{

  @override
  Future<List<MarvelHero>> fetchHeroesFromApi() async {
    final List<MarvelHero> herosAPI = [];

    final timeStamp = 1.toString();
    final hash = generateHash(timeStamp);

    final dio = Dio();
    final response = await dio.get<Map<String, dynamic>>(
      '$baseUrl?apikey=$publicKey&ts=$timeStamp&hash=$hash',
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          response.data!;

      final Map<String, dynamic> data =
          responseData['data'] as Map<String, dynamic>;

      final List<dynamic> heroesList = data['results'] as List<dynamic>;

      for (var i = 0; i < heroesList.length; i++) {
        final Map<String, dynamic> hero = heroesList[i] as Map<String, dynamic>;

        final String localImagePath = await ImageDownloader().downloadAndSaveImage(
          "${hero['thumbnail']['path']}.${hero['thumbnail']['extension']}",
          'hero_${hero['name']}.${hero['thumbnail']['extension']}',
        );
        hero['thumbnail']['path'] = localImagePath;
        herosAPI.add(MarvelHero.fromJson(hero));
      }

      return herosAPI;
    } else {
      throw Exception('Failed to load heroes');
    }
  }

  String generateHash(String timeStamp) {
    final bytes = utf8.encode('$timeStamp$privateKey$publicKey');
    final digest = md5.convert(bytes);
    return digest.toString();
  }
}
