import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/generated/l10n.dart';
import 'package:marvel_app/src/core/constants/colors.dart';
import 'package:marvel_app/src/core/constants/image_path.dart';
import 'package:marvel_app/src/core/router/router.dart';
import 'package:marvel_app/src/feature/home/bloc/home_bloc.dart';
import 'package:marvel_app/src/feature/home/bloc/home_event.dart';
import 'package:marvel_app/src/feature/home/bloc/home_state.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';

import 'package:marvel_app/src/feature/home/widget/diagonal_background_painter.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  late DiagonalBackgroundPainter backgroundPainter;

  int currentPage = 0;
  int indeximageBG = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    backgroundPainter = DiagonalBackgroundPainter(paintColor: Colors.red);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: backgroundPainter,
          child: const Center(),
        ),
        Column(
          children: [
            const SizedBox(height: 50,),
            Expanded(
              child: Image.asset(
                marvelLogo,
                height: 50,
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              flex: 2,
              child: Text(
                S.of(context).chooseYourHero,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Expanded(
              flex: 10,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeInitial) {
                    context.read<HomeBloc>().add(FetchData());
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    final List<MarvelHero> heroes = state.heroes;

                    // Обработка, когда пользователь тапает по уведомлению
                    FirebaseMessaging.onMessageOpenedApp
                        .listen((RemoteMessage message) async {
                      final String heroId =
                          message.data['heroId'] as String;

                      final MarvelHero hero = heroes
                          .where(
                            (element) => element.id.toString() == heroId,
                          )
                          .first;

                      await context.router.push(
                        InfoRoute(
                          hero: hero,
                          bgPainter: backgroundPainter,
                        ),
                      );
                    });

                    return PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) => {
                        setState(
                          () {
                            indeximageBG = value % bgColors.length;
                            backgroundPainter = DiagonalBackgroundPainter(
                                paintColor: bgColors[indeximageBG]);
                            currentPage = value;
                          },
                        ),
                      },
                      itemCount: heroes.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, int index) => GestureDetector(
                        onTap: () {
                          context.router.push(
                            InfoRoute(
                              hero: heroes[index],
                              bgPainter: backgroundPainter,
                            ),
                          );
                        },
                        child: AnimatedScale(
                          scale: index == currentPage ? 1 : 0.8,
                          duration: const Duration(milliseconds: 300),
                          child: Hero(
                            tag: heroes[index].name,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: FileImage(
                                      File(heroes[index].imagePath)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Text(
                                    heroes[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (state is HomeError) {
                    return Text('Erorr: ${state.message}');
                  } else {
                    return Text(S.of(context).noDataForDisplay);
                  }
                },
              ),
            ),
            const SizedBox(height: 40,),
          ],
        ),
      ],
    ),
  );
}
