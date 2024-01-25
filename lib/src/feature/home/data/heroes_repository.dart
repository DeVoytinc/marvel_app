import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';
import 'package:marvel_app/src/feature/home/data/data_source/marvel_api_data_source.dart';
import 'package:marvel_app/src/feature/home/data/data_source/marvel_storage_data_source.dart';

abstract class MarvelHeroesRepository {
 Future<List<MarvelHero>> fetchHeroes();
}

class MarvelHeroesRepositoryImpl extends MarvelHeroesRepository{
  MarvelHeroesRepositoryImpl({required this.apiDataSource, required this.storageDataSource});

  final MarvelApiDataSource apiDataSource;
  final MarvelStorageDataSource storageDataSource;

  @override
  Future<List<MarvelHero>> fetchHeroes() async {
    try {
      return await apiDataSource.fetchHeroesFromApi(storageDataSource);
    } catch (apiError) {
      print('Error fetching data from API: $apiError');
      try {
        return await storageDataSource.loadHeroesFromStorage();
      } catch (storageError) {
        print('Error loading data from storage: $storageError');
        throw Exception('Failed to fetch data');
      }
    }
  }
}