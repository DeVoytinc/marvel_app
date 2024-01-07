import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marvel_app/models/hero.dart';

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

String generateHash(String timeStamp) {
  var bytes = utf8.encode('$timeStamp$privateKey$publicKey');
  var digest = md5.convert(bytes);
  return digest.toString();
}

Future<List<dynamic>> fetchHeroes() async {
  final timeStamp = 1.toString();
  final hash = generateHash(timeStamp);

  final dio = Dio();

  final response = await dio.get('$baseUrl?apikey=$publicKey&ts=$timeStamp&hash=$hash');

  if (response.statusCode == 200) {
    Map<String, dynamic> responseData = response.data; // response.data is already a Map
    Map<String, dynamic> data = responseData['data'] as Map<String, dynamic>;

    List<dynamic> heroesList = data['results'];
    
    int indeximageBG = 0;
    for (var i = 0; i < heroesList.length; i++) {
      Map<String, dynamic> hero = heroesList[i] as Map<String, dynamic>;
      herosAPI.add(MarvelHero.fromJson(hero, imagesBG[indeximageBG]));
      indeximageBG++;
      if (indeximageBG >= imagesBG.length) indeximageBG = 0;
    }
    return herosAPI;
  } else {
    throw Exception('Failed to load heroes');
  }
}
