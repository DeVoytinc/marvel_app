import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/feature/app/widget/material_context.dart';
import 'package:marvel_app/src/feature/home/bloc/home_bloc.dart';
import 'package:marvel_app/src/feature/initialization/model/dependencies.dart';
import 'package:marvel_app/src/feature/initialization/widget/dependencies_provider.dart';

class App extends StatelessWidget {
  const App({
    required this.result,
    super.key,
  });

  void run() => runApp(this);

  final Dependencies result;

  @override
  Widget build(BuildContext context) => DependenciesProvider(
        dependencies: result,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeBloc(
                marvelHeroesService: result.heroesService,
              ),
            ),
          ],
          child: const MaterialContext(),
        ),
      );
}
