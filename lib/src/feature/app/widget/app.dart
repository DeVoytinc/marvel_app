import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/src/core/widget/scope_widgets.dart';
import 'package:marvel_app/src/feature/app/widget/material_context.dart';
import 'package:marvel_app/src/feature/home/bloc/home_bloc.dart';
import 'package:marvel_app/src/feature/initialization/model/initialization_progress.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:marvel_app/src/feature/initialization/widget/dependencies_scope.dart';

class App extends StatelessWidget {
  const App({
    required this.result,
    super.key,
  });

  void run() => runApp(this);

  final InitializationResult result;

  @override
  Widget build(BuildContext context) => DefaultAssetBundle(
        bundle: SentryAssetBundle(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeBloc(repository: result.repositories.marvelHeroesRepository)
            ),
          ],
          child: ScopeProvider(
            buildScope: (child) => DependenciesScope(
              dependencies: result.dependencies,
              repositories: result.repositories,
              child: child,
            ),
            child: MaterialContext(),
          ),
        ),
      );
}
