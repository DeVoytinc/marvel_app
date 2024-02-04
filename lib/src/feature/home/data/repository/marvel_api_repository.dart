import 'package:marvel_app/src/feature/home/data/data_source/marvel_api_data_source.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';

abstract class MarvelApiRepository {
  Future<List<MarvelHero>> fetchHeroes();
}

class MarvelApiRepositoryImpl extends MarvelApiRepository{
  final MarvelApiDataSource apiDataSource;

  MarvelApiRepositoryImpl(this.apiDataSource);

  @override
  Future<List<MarvelHero>> fetchHeroes() async =>
      apiDataSource.fetchHeroesFromApi();
}
