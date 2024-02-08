import 'package:flutter/material.dart';
import 'package:marvel_app/generated/l10n.dart';
import 'package:marvel_app/src/core/constants/colors.dart';
import 'package:marvel_app/src/core/constants/image_path.dart';
import 'package:marvel_app/src/feature/home/model/models_data.dart';
import 'package:marvel_app/src/feature/home/widget/diagonal_background_painter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
            const SizedBox(
              height: 50,
            ),
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
              child: PageView.builder(
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
                itemCount: heros.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, int index) => AnimatedScale(
                  scale: index == currentPage ? 1 : 0.8,
                  duration: const Duration(milliseconds: 300),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: ExactAssetImage(heros[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          heros[index].name,
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
            const SizedBox(height: 40,),
          ],
        ),
      ],
    ),
  );
}
