import 'package:marvel_app/src/feature/initialization/model/environment.dart';

abstract class IEnvironmentStore {
  abstract final Environment environment;
  abstract final String sentryDsn;

  bool get isProduction => environment == Environment.prod;
}

class EnvironmentStore extends IEnvironmentStore {
  EnvironmentStore();

  /// The Sentry DSN.
  @override
  String get sentryDsn => const String.fromEnvironment('sentry_dsn');

  /// The environment.
  @override
  Environment get environment => Environment.from(
        String.fromEnvironment(
          'ENVIRONMENT',
          defaultValue: Environment.dev.value,
        ),
      );

  /// Whether Sentry is enabled.
  bool get enableTrackingManager => sentryDsn.isNotEmpty;
}
