import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/core/router/router.dart';
import 'package:marvel_app/src/feature/home/data/data_source/marvel_api_data_source.dart';
import 'package:marvel_app/src/feature/home/data/data_source/marvel_storage_data_source.dart';
import 'package:marvel_app/src/feature/home/data/heroes_repository.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';
import 'package:marvel_app/models/models_data.dart';
import 'package:marvel_app/src/feature/home/bloc/home_bloc.dart';
import 'package:marvel_app/src/feature/home/bloc/home_event.dart';
import 'package:marvel_app/src/feature/home/bloc/home_state.dart';
import 'package:marvel_app/widgets/marvel_logo.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;

  int currentPage = 0;
  int indeximageBG = 0;

  bool imagesLoaded = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);

    MarvelHeroesRepositoryImpl repository = MarvelHeroesRepositoryImpl(
      apiDataSource: MarvelApiDataSource(),
      storageDataSource: MarvelStorageDataSource(),
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      // Обработка, когда пользователь тапает по уведомлению и приложение открывается
      String heroId = message.data['heroId'];

      List<MarvelHero> heroes = await repository.fetchHeroes();
      MarvelHero hero =
          heroes.where((element) => element.id.toString() == heroId).first;

      // ignore: use_build_context_synchronously
      context.router.push(InfoRoute(
        hero: hero,
        indeximageBG: indeximageBG));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<void> precacheImages(List<String> imageList) async {
    for (var imagePath in imageList) {
      await precacheImage(AssetImage(imagePath), context);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Предварительно загружаем изображения
    precacheImages(imagesBG).then((_) {
      setState(() {
        imagesLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(imagesBG[indeximageBG]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 50,
                ),
                child: MarvelLogo(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  'Choose your hero',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeInitial) {
                      context.read<HomeBloc>().add(FetchData());
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeLoaded) {
                      List<MarvelHero> heroes = state.heroes;

                      return PageView.builder(
                        controller: _pageController,
                        onPageChanged: (value) => {
                          setState(
                            () {
                              indeximageBG = value % imagesBG.length;
                              currentPage = value;
                            },
                          )
                        },
                        itemCount: heroes.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          return GestureDetector(
                            //row gesture detector
                            onTap: () {
                              context.router.push(InfoRoute(
                                  hero: heroes[index],
                                  indeximageBG: indeximageBG));
                            },
                            child: AnimatedScale(
                              scale: index == currentPage ? 1 : 0.8,
                              duration: const Duration(milliseconds: 300),
                              child: Hero(
                                tag: heroes[index].name,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: getImageProvider(
                                          heroes[index].imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Text(
                                        heroes[index].name,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is HomeError) {
                      return Text('Ошибка: ${state.message}');
                    } else {
                      return Text('Нечего отображать');
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  bool isUrl(String path) {
    return path.startsWith(RegExp(r'http?:\/\/'));
  }

  ImageProvider getImageProvider(String imagePath) {
    if (isUrl(imagePath)) {
      // Если это URL, возвращаем NetworkImage
      return NetworkImage(imagePath);
    } else {
      // Если это локальный путь, возвращаем FileImage
      return FileImage(File(imagePath));
    }
  }
}
