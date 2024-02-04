import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/src/feature/hero_info/widget/info_screen.dart';
import 'package:marvel_app/src/feature/home/model/marvel_hero.dart';
import 'package:marvel_app/src/feature/home/widget/diagonal_background_painter.dart';
import 'package:marvel_app/src/feature/home/widget/home_screen.dart';

part 'router.gr.dart';

/// The configuration of app routes.
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          initial: true,
        ),
        AutoRoute(
          page: InfoRoute.page,
          path: '/info',
        ),
      ];
}
