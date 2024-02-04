import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';
import 'package:marvel_app/src/feature/home/widget/diagonal_background_painter.dart';

@RoutePage()
class InfoScreen extends StatelessWidget {
  const InfoScreen({required this.hero, required this.bgPainter, super.key});

  final MarvelHero hero;
  final DiagonalBackgroundPainter bgPainter;

  void _backPage(BuildContext context) => context.router.pop();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack( 
      children: [
        CustomPaint(
          painter: bgPainter,
          child: const Center(),
        ),
        Positioned.fill(
          child: Hero(
            tag: hero.name,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(hero.imagePath)),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.8,
                      ),
                      Text(
                        hero.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        hero.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: IconButton(
            alignment: Alignment.topLeft,
            onPressed: () => _backPage(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
