import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'bloc_observer.dart';
import 'container_injector.dart';
import 'features/agents/agents_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initFixture();
  initCore();
  Bloc.observer = MyBlocObserver();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Run app
  runApp(
      const MyApp());
}
