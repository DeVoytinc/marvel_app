import 'package:flutter/material.dart';
import 'package:marvel_app/models/models_data.dart';
import 'package:marvel_app/widgets/marvel_logo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
                image: ExactAssetImage(heros[currentPage].imageBGPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
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
                  itemCount: heros.length,
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
                              image: ExactAssetImage(heros[index].imagePath),
                              fit: BoxFit.cover),
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
