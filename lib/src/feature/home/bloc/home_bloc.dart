import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';
import 'package:marvel_app/src/feature/home/bloc/home_event.dart';
import 'package:marvel_app/src/feature/home/bloc/home_state.dart';
import 'package:marvel_app/src/feature/home/data/heroes_repository.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MarvelHeroesRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<FetchData>((event, emit) async {
      emit(HomeLoading());
      try {
        // Получаем героев через репозиторий, который сам решит, откуда взять данные
        List<MarvelHero> heroes = await repository.fetchHeroes();
        emit(HomeLoaded(heroes));
      } catch (error) {
        // Ошибка будет поймана здесь, если не удалось получить данные ни из API, ни из хранилища
        print('Error fetching data: $error');
        emit(HomeError('Failed to fetch data'));
      }
    });
  }
}