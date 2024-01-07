import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/firebase_options.dart';
import 'package:marvel_app/src/core/utils/logger.dart';
import 'package:marvel_app/src/feature/app/logic/app_runner.dart';
import 'package:marvel_app/src/feature/initialization/model/initialization_hook.dart';

//1011334
//1009149

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final notificationSettings =
      await FirebaseMessaging.instance.requestPermission(provisional: true);

  final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
  if (apnsToken != null) {
    // APNS token is available, make FCM plugin API requests...
  }

  logger.runLogging(
    () => runZonedGuarded(
      () => AppRunner().initializeAndRun(InitializationHook.setup()),
      logger.logZoneError,
    ),
    const LogOptions(),
  );
}
