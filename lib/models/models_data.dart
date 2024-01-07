import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marvel_app/models/hero.dart';
import 'package:marvel_app/data/db_manager.dart';

const String publicKey = 'b599b2cea5c8b794ba83cadf41a70e67';
const String privateKey = '768333402f2317458d0ead51c300c9f3947a0b64';
const String baseUrl = 'https://gateway.marvel.com/v1/public/characters';

final List<String> imagesBG = [
  'assets/images/background/bluebg.png',
  'assets/images/background/redbg.png',
  'assets/images/background/yellowbg.png',
  'assets/images/background/purplebg.png',
  'assets/images/background/greenbg.png',
];

final List<MarvelHero> herosAPI = [];

class MarvelData {

  static Future<List<MarvelHero>> fetchData() async {
    List<MarvelHero> heroes = [];

    try {
      heroes = await _fetchHeroesFromApi();
    } catch (apiError) {

      print('Error fetching data from API: $apiError');

      try {
        heroes = await _loadHeroesFromStorage();
      } catch (storageError) {
        print('Error loading data from storage: $storageError');
        throw Exception('Failed to fetch data');
      }

    }

    return heroes;
  }

  static Future<List<MarvelHero>> _fetchHeroesFromApi() async {
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
      
      final db = await DatabaseManager.database;

      for (var i = 0; i < heroesList.length; i++) {
        Map<String, dynamic> hero = heroesList[i] as Map<String, dynamic>;
        herosAPI.add(MarvelHero.fromJson(hero));

        await db.saveCharacter(MarvelHero.fromJson(hero));
      }
      return herosAPI;
    } else {
      throw Exception('Failed to load heroes');
    }
  }
  
  static Future<List<MarvelHero>> _loadHeroesFromStorage() async {
    final db = await DatabaseManager.database;
    final characters = await db.getAllCharacters();
    List<MarvelHero> heroes = characters.map(MarvelHero.fromData).toList();
    return heroes;
  }

  

  static String generateHash(String timeStamp) {
    var bytes = utf8.encode('$timeStamp$privateKey$publicKey');
    var digest = md5.convert(bytes);
    return digest.toString();
  }
}