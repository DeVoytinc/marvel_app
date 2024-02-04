// import 'dart:io';

// import 'package:flutter/material.dart';

// class SizedPagerView extends StatelessWidget {
//   const SizedPagerView({super.key});

//   @override
//   Widget build(BuildContext context) => PageView.builder(
//         controller: _pageController,
//         onPageChanged: (value) => {
//           setState(
//             () {
//               indeximageBG = value % bgColors.length;
//               backgroundPainter =
//                   DiagonalBackgroundPainter(paintColor: bgColors[indeximageBG]);
//               currentPage = value;
//             },
//           ),
//         },
//         itemCount: heroes.length,
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, int index) => GestureDetector(
//           onTap: () {
//             context.router.push(
//               InfoRoute(
//                 hero: heroes[index],
//                 bgPainter: backgroundPainter,
//               ),
//             );
//           },
//           child: AnimatedScale(
//             scale: index == currentPage ? 1 : 0.8,
//             duration: const Duration(milliseconds: 300),
//             child: Hero(
//               tag: heroes[index].name,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     image: FileImage(File(heroes[index].imagePath)),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Container(
//                   alignment: Alignment.bottomLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.all(25.0),
//                     child: Text(
//                       heroes[index].name,
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
// }
