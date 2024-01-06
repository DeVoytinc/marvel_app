import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';


abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<MarvelHero> heroes;

  HomeLoaded(this.heroes);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}