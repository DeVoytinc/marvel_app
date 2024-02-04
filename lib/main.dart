import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marvel_app/src/feature/app/logic/app_runner.dart';

// несколько id героев для проверки пушей
//1011334
//1009149

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppRunner().initializeAndRun();
}
