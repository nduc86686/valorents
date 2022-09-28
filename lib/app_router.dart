import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valo/screen2/main2.dart';

import 'container_injector.dart';
import 'features/agents/presentation/cubit/agent_cubit.dart';
import 'features/agents/presentation/screen/agent_screen.dart';

class Routes {
  static const String agents = "agents";
  static const String home = "home";
  static const String soccer = "soccer";
  static const String fixtures = "fixtures";
  static const String standings = "standings";
  static const String fixture = "fixture";
}

class AppRouter {
  static Route routesGenerator(RouteSettings settings) {
    switch (settings.name) {
        case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<AgentCubit>()..getAgents(),
            child: const MainScreen(),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => const NoRouteFound());
  }
}

class NoRouteFound extends StatelessWidget {
  const NoRouteFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('AppStrings.noRouteFound')),
      );
}
