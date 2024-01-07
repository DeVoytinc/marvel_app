import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marvel_app/models/hero.dart';
import 'package:marvel_app/models/models_data.dart';
import 'package:marvel_app/screens/info_screen.dart';
import 'package:marvel_app/widgets/marvel_logo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen(this.marvelHeros, {Key? key}) : super(key: key);

  final List<MarvelHero> marvelHeros;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late List<MarvelHero> heros;

  late final PageController _pageController;

  int currentPage = 0;
  int indeximageBG = 0;

  _nextPage(MarvelHero hero, int indeximageBG) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => InfoScreen(
                hero: hero,
                indeximageBG: indeximageBG,
              )),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    heros = widget.marvelHeros;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
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
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) => {
                    setState(
                      () {
                        currentPage = value;
                        indeximageBG++;
                        if (indeximageBG >= imagesBG.length - 1) indeximageBG = 0;
                      },
                    )
                  },
                  itemCount: heros.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return GestureDetector( //row gesture detector
                      onTap: () {
                        _nextPage(heros[index], indeximageBG);
                      },
                      child: AnimatedScale(
                        scale: index == currentPage ? 1 : 0.8,
                        duration: const Duration(milliseconds: 300),
                        child: Hero(
                          tag: heros[index].name,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: getImageProvider(heros[index].imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Text(
                                  heros[index].name,
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
