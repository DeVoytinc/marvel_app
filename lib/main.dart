import 'package:flutter/material.dart';

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
      home: PageViewHeros(),
    );
  }
}

class PageViewHeros extends StatefulWidget {
  const PageViewHeros({Key? key}) : super(key: key);

  @override
  _PageViewHerosState createState() => _PageViewHerosState();
}

class _PageViewHerosState extends State<PageViewHeros> {
  final PageController _pageController = PageController(
    viewportFraction: 0.75,
  );

  int currentPage = 0;

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
                image: ExactAssetImage(cities[currentPage].imageBGPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Image.asset(
                  'assets/images/marvel.png',
                  height: 50,
                ),
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
                height: MediaQuery.of(context).size.height / 1.7,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) => {
                    setState(
                      () {
                        currentPage = value;
                      },
                    )
                  },
                  itemCount: cities.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return AnimatedScale(
                      scale: index == currentPage ? 1 : 0.8,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        //margin: const EdgeInsets.only(left: 12, right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: ExactAssetImage(cities[index].imagePath),
                              fit: BoxFit.cover),
                        ),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              cities[index].name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
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
}

class Heros {
  final String name;
  final String imagePath;
  final String imageBGPath;

  Heros(this.name, this.imagePath, this.imageBGPath);
}

final List<Heros> cities = [
  Heros(
    'Capitan',
    'assets/images/heros/capitan.jpg',
    'assets/images/background/bluebg.png',
  ),
  Heros(
    'Deadpool',
    'assets/images/heros/dedpool.jpg',
    'assets/images/background/redbg.png',
  ),
  Heros(
    'Iron man',
    'assets/images/heros/iron.jpg',
    'assets/images/background/yellowbg.png',
  ),
  Heros(
    'Spiderman',
    'assets/images/heros/spiderman.jpg',
    'assets/images/background/purplebg.png',
  ),
  Heros(
    'Dr. Strange',
    'assets/images/heros/strange.jpg',
    'assets/images/background/greenbg.png',
  ),
  Heros(
    'Tanos',
    'assets/images/heros/tanos.jpg',
    'assets/images/background/redbg.png',
  ),
  Heros(
    'Thor',
    'assets/images/heros/thor.jpg',
    'assets/images/background/bluebg.png',
  ),
];
