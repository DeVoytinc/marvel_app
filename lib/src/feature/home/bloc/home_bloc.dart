import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/feature/home/bloc/home_event.dart';
import 'package:marvel_app/src/feature/home/bloc/home_state.dart';
import 'package:marvel_app/src/feature/home/data/marvel_heroes_service.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MarvelHeroesService marvelHeroesService;

  HomeBloc({required this.marvelHeroesService}) : super(HomeInitial()) {
    on<FetchData>((event, emit) async {
      emit(HomeLoading());
      try {
        final List<MarvelHero> heroes = await marvelHeroesService.fetchHeroes();
        emit(HomeLoaded(heroes));
      } catch (error) {
        emit(HomeError('Failed to fetch data'));
      }
    });
  }
}
