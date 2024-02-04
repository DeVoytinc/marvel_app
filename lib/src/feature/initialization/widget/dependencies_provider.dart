import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel_app/src/feature/initialization/model/dependencies.dart';

class DependenciesProvider extends InheritedWidget {
  final Dependencies dependencies;

  const DependenciesProvider({
    required this.dependencies,
    required super.child,
    super.key,
  });

  static Dependencies of(BuildContext context) {
    final DependenciesProvider? result =
        context.dependOnInheritedWidgetOfExactType<DependenciesProvider>();
    assert(result != null, 'No Dependencies found in context');
    return result!.dependencies;
  }

  @override
  bool updateShouldNotify(DependenciesProvider oldWidget) =>
      dependencies != oldWidget.dependencies;
}
