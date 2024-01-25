import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marvel_app/src/feature/home/data/data_source/marvel_storage_data_source.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';

class MarvelApiDataSource {
  final String publicKey = 'b599b2cea5c8b794ba83cadf41a70e67';
  final String privateKey = '768333402f2317458d0ead51c300c9f3947a0b64';
  final String baseUrl = 'https://gateway.marvel.com/v1/public/characters';

  Future<List<MarvelHero>> fetchHeroesFromApi(MarvelStorageDataSource? db) async {
        final List<MarvelHero> herosAPI = [];

    final timeStamp = 1.toString();
    final hash = generateHash(timeStamp);

    final dio = Dio();
    final response =
        await dio.get('$baseUrl?apikey=$publicKey&ts=$timeStamp&hash=$hash');

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.data;
      Map<String, dynamic> data = responseData['data'] as Map<String, dynamic>;

      List<dynamic> heroesList = data['results'];
      
      //final MarvelStorageDataSource db;

      if (db != null){
        for (var i = 0; i < heroesList.length; i++) {
          Map<String, dynamic> hero = heroesList[i] as Map<String, dynamic>;
          herosAPI.add(MarvelHero.fromJson(hero));

          await db.saveCharacter(MarvelHero.fromJson(hero));
        }
      }
        
      
      
      return herosAPI;
    } else {
      throw Exception('Failed to load heroes');
    }
  }

  String generateHash(String timeStamp) {
    var bytes = utf8.encode('$timeStamp$privateKey$publicKey');
    var digest = md5.convert(bytes);
    return digest.toString();
  }
}