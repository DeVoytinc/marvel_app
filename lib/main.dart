import 'package:flutter/material.dart';
import 'package:marvel_app/generated/l10n.dart';
import 'package:marvel_app/src/core/theme/app_theme.dart';
import 'package:marvel_app/src/feature/home/widget/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      localizationsDelegates: const [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('en'),
      home: const MainScreen(),
    );
}
