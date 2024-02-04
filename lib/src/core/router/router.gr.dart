// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    InfoRoute.name: (routeData) {
      final args = routeData.argsAs<InfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InfoScreen(
          key: args.key,
          hero: args.hero,
          bgPainter: args.bgPainter,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InfoScreen]
class InfoRoute extends PageRouteInfo<InfoRouteArgs> {
  InfoRoute({
    Key? key,
    required MarvelHero hero,
    required DiagonalBackgroundPainter bgPainter,
    List<PageRouteInfo>? children,
  }) : super(
          InfoRoute.name,
          args: InfoRouteArgs(
            key: key,
            hero: hero,
            bgPainter: bgPainter,
          ),
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static const PageInfo<InfoRouteArgs> page = PageInfo<InfoRouteArgs>(name);
}

class InfoRouteArgs {
  const InfoRouteArgs({
    this.key,
    required this.hero,
    required this.bgPainter,
  });

  final Key? key;

  final MarvelHero hero;

  final DiagonalBackgroundPainter bgPainter;

  @override
  String toString() {
    return 'InfoRouteArgs{key: $key, hero: $hero, bgPainter: $bgPainter}';
  }
}
