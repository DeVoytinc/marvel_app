import 'package:marvel_app/src/feature/initialization/logic/initialization_steps.dart';
import 'package:marvel_app/src/feature/initialization/model/initialization_hook.dart';
import 'package:marvel_app/src/feature/initialization/model/initialization_progress.dart';
import 'package:marvel_app/src/core/utils/logger.dart';
import 'package:marvel_app/src/feature/app/logic/tracking_manager.dart';
import 'package:marvel_app/src/feature/initialization/model/environment_store.dart';

part 'initialization_factory.dart';

mixin InitializationProcessor {
  Future<InitializationResult> processInitialization({
    required Map<String, StepAction> steps,
    required InitializationFactory factory,
    required InitializationHook hook,
  }) async {
    final stopwatch = Stopwatch()..start();
    var stepCount = 0;
    final env = factory.getEnvironmentStore();
    var progress = InitializationProgress(environment: env);
    final trackingManager = factory.createTrackingManager(env);
    await trackingManager.enableReporting();
    try {
      await for (final step in Stream.fromIterable(steps.entries)) {
        stepCount++;
        final p = await step.value(progress);
        if (p != null) {
          progress = p;
          hook.onInitializing?.call(p);
        }
      }
    } on Object catch (_) {
      hook.onError?.call(stepCount);
      rethrow;
    }
    stopwatch.stop();
    final result = InitializationResult(
      dependencies: progress.dependencies(),
      repositories: progress.repositories(),
      stepCount: stepCount,
      msSpent: stopwatch.elapsedMilliseconds,
    );
    hook.onInitialized?.call(result);
    return result;
  }
}
