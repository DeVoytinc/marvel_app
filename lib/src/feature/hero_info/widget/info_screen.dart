import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/backgrounds/backgrounds.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';

@RoutePage()
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.hero, required this.indeximageBG});

  final MarvelHero hero;
  final int indeximageBG;

  void _backPage(BuildContext context) => context.router.pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Stack(
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
          Hero(
            tag: hero.name,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: getImageProvider(hero.imagePath), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hero.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      hero.description,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: IconButton(
              alignment: Alignment.topLeft,
              onPressed: () {
                _backPage(context);
              },
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
