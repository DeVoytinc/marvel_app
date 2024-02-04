
import 'package:marvel_app/src/feature/home/data/repository/marvel_api_repository.dart';
import 'package:marvel_app/src/feature/home/data/repository/marvel_storage_repository.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';

abstract class MarvelHeroesService {
  Future<List<MarvelHero>> fetchHeroes();
}

class MarvelHeroesServiceImpl extends MarvelHeroesService{
  final MarvelApiRepository apiRepository;
  final MarvelStorageRepository storageRepository;

  MarvelHeroesServiceImpl(this.apiRepository, this.storageRepository);

  @override
  Future<List<MarvelHero>> fetchHeroes() async {
    try {
      final heroes = await apiRepository.fetchHeroes();
      await storageRepository.saveHeroesToStorage(heroes);
      return heroes;
    } catch (apiError) {
      return storageRepository.loadHeroesFromStorage();
    }
  }
}