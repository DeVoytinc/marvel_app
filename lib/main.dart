// import 'package:flutter/material.dart';
// import 'package:marvel_app/models/hero.dart';
// import 'package:marvel_app/models/models_data.dart';
// import 'package:marvel_app/screens/main_screen.dart';
import 'dart:async';

import 'package:marvel_app/src/core/utils/logger.dart';
import 'package:marvel_app/src/feature/app/logic/app_runner.dart';
import 'package:marvel_app/src/feature/initialization/model/initialization_hook.dart';

void main() {
  logger.runLogging(
    () => runZonedGuarded(
      () => AppRunner().initializeAndRun(InitializationHook.setup()),
      logger.logZoneError,
    ),
    const LogOptions(),
  );
}
