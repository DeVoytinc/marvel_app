import 'package:flutter/material.dart';
import 'package:marvel_app/models/hero.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.hero});

  final MarvelHero hero;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {


  _backPage(){
      Navigator.pop(context);
  }

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
                image: ExactAssetImage(widget.hero.imageBGPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Hero(
            tag: widget.hero.name,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(widget.hero.imagePath),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.hero.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.hero.description,
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
              onPressed: () {_backPage();},
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
}
