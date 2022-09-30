import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app.dart';
import 'bloc_observer.dart';
import 'container_injector.dart';
import 'features/agents/agents_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  initFixture();
  initCore();
  RequestConfiguration configuration =
  RequestConfiguration(testDeviceIds: ["410BDF9B0811933F749C4AA154B910F4"]);
  MobileAds.instance.updateRequestConfiguration(configuration);
  Bloc.observer = MyBlocObserver();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Run app
  runApp(
      const MyApp());
}
