import 'package:auto_route/auto_route.dart';
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
          path: '/',
          initial: true,
          // children: [
          //   AutoRoute(
          //     page: FactsRoute.page,
          //     path: 'facts',
          //     initial: true,
          //   ),
          //   AutoRoute(
          //     page: HistoryRoute.page,
          //     path: 'history',
          //   )
          // ],
        ),
      ];
}
