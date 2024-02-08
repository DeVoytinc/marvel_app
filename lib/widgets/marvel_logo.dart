import 'package:flutter/material.dart';

class MarvelLogo extends StatelessWidget {
  const MarvelLogo({super.key});

  @override
  Widget build(BuildContext context) => Image.asset(
      'assets/images/marvel.png',
      height: 50,
    );
}
