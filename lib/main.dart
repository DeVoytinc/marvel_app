import 'package:flutter/material.dart';
import 'package:marvel_app/models/hero.dart';
import 'package:marvel_app/models/models_data.dart';
import 'package:marvel_app/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  FutureBuilder(
        future: MarvelData.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            return MainScreen(snapshot.data as List<MarvelHero>);
          }
        }
      ),
    );
  }
}

