import 'package:flutter/material.dart';
import 'package:marvel_app/src/core/localization/localization.dart';
import 'package:marvel_app/src/feature/initialization/widget/dependencies_scope.dart';


class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    final router = DependenciesScope.dependenciesOf(context).router;
    return MaterialApp.router(
      routerConfig: router.config(),
      localizationsDelegates: Localization.localizationDelegates,
      supportedLocales: Localization.supportedLocales,
      //theme: theme.lightTheme,
      //darkTheme: theme.darkTheme,
      locale: const Locale('es'),
    );
  }
}
