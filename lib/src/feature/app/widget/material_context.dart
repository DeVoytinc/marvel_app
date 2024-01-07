import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/localization/localization.dart';
import 'package:marvel_app/src/feature/initialization/widget/dependencies_scope.dart';


class MaterialContext extends StatelessWidget {
  MaterialContext({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final router = DependenciesScope.dependenciesOf(context).router;
    return MaterialApp.router(
      key: navigatorKey,
      routerConfig: router.config(),
      localizationsDelegates: Localization.localizationDelegates,
      supportedLocales: Localization.supportedLocales,
      debugShowCheckedModeBanner: false,
      //theme: theme.lightTheme,
      //darkTheme: theme.darkTheme,
      locale: const Locale('es'),
    );
  }
}
