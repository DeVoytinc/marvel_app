import 'dart:async';
import 'package:marvel_app/src/feature/app/widget/app.dart';
import 'package:marvel_app/src/feature/initialization/logic/dependencies_initializer.dart';

class AppRunner{
  Future<void> initializeAndRun() async {
    final result = await DependenciesInitializer.initializeDependencies();

    App(result: result).run();
  }
}
