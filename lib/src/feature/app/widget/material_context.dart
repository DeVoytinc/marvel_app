import 'package:flutter/material.dart';
import 'package:marvel_app/generated/l10n.dart';
import 'package:marvel_app/src/feature/app/model/app_theme.dart';
import 'package:marvel_app/src/feature/initialization/widget/dependencies_provider.dart';


class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final router = DependenciesProvider.of(context).route;
    return MaterialApp.router(
      key: navigatorKey,
      routerConfig: router.config(),
      localizationsDelegates: const [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      theme: appTheme(context),
    );
  }
}
