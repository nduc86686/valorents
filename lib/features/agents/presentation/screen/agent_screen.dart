import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/constants/app_colors.dart';
import 'package:valo/features/agents/domain/entities/agents.dart';
import 'package:valo/network/agent_client.dart';

import '../../../../container_injector.dart';
import '../../domain/use_cases/agents_usecase.dart';
import '../cubit/agent_cubit.dart';
import '../cubit/agent_state.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  // Agent Client
  final AgentClient _agentClient = AgentClient();

  // Agents List
  // late Future<Iterable<Agent>> agents;

  // Selected Filter Index
  int selectedFilterIndex = 0;

  // Agent Filter List
  var agentFilters = [
    'All',
    'Duelist',
    'Sentinel',
    'Initiator',
    'Controller',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h, left: 13.w),
                child: const Text(
                  'Agents',
                  style: TextStyle(
                      color: white, fontSize: 30, fontFamily: 'Valorant'),
                  textAlign: TextAlign.start,
                ),
              ),

              // Agent Filters
              // Expanded(
              //   flex: 1,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: agentFilters.length,
              //     itemBuilder: (context, index) {
              //       return LayoutBuilder(builder: (context, constraints) {
              //         return Padding(
              //           padding: EdgeInsets.all(Platform.isAndroid
              //               ? 8.w
              //               :
              //               // iPhone 7 - 38 and iPhone 5S - SE 1. Gen - 32
              //               constraints.maxHeight.round() == 38 ||
              //                       constraints.maxHeight.round() == 32
              //                   ? 7.h
              //                   :
              //                   // Others
              //                   10.w),
              //           // Gesture detector for index update
              //           child: GestureDetector(
              //             onTap: () {
              //               if (agentFilters[index].toLowerCase() == 'all') {
              //                 //   setState(() {
              //                 //     agents = _agentClient.getAgents();
              //                 //     selectedFilterIndex = index;
              //                 //   });
              //                 // } else {
              //                 //   setState(() {
              //                 //     agents = _agentClient.getAgents(
              //                 //         agentRole: agentFilters[index]);
              //                 //     selectedFilterIndex = index;
              //                 //   });
              //               }
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   // If box selected bg color red and text color white
              //                   // If box unselected bg color white and text color black
              //                   color: selectedFilterIndex == index
              //                       ? CupertinoColors.systemRed
              //                       : CupertinoColors.white),
              //               width: 100.w,
              //               alignment: Alignment.center,
              //               child: Text(
              //                 agentFilters[index],
              //                 style: TextStyle(
              //                     color: selectedFilterIndex == index
              //                         ? white
              //                         : black,
              //                     fontFamily: 'Valorant',
              //                     fontSize: 10.5.sp),
              //                 textAlign: TextAlign.center,
              //               ),
              //             ),
              //           ),
              //         );
              //       });
              //     },
              //   ),
              // ),

              const AgentListWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class AgentListWidget extends StatelessWidget {
  const AgentListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AgentCubit(agentsUseCase: sl<AgentsUseCase>())..getLeagues(),
      child: BlocBuilder<AgentCubit, AgentsStates>(
        builder: (context, state) {
          if (state is AgentsLoaded) {
            print('loadddddddddd');
            return Expanded(
              child: GridView.builder(
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2 / 2.4),
                itemCount: state.agents.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: AgentsCard(
                      agent: state.agents[index],
                      index: index,
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class AgentsCard extends StatelessWidget {
  AgentsCard({Key? key, required this.agent, required this.index})
      : super(key: key);

  Agent agent;
  int index;

  @override
  Widget build(BuildContext context) {
    // Agent Colors
    var agentColors = {
      'fade': fadeColors,
      'breach': breachColors,
      'raze': razeColors,
      'chamber': chamberColors,
      'kay/o': kayoColors,
      'skye': skyeColors,
      'cypher': cypherColors,
      'sova': sovaColors,
      'killjoy': killjoyColors,
      'viper': viperColors,
      'phoenix': phoenixColors,
      'astra': astraColors,
      'brimstone': brimstoneColors,
      'neon': neonColors,
      'yoru': yoruColors,
      'sage': sageColors,
      'reyna': reynaColors,
      'omen': omenColors,
      'jett': jettColors,
    };
    return GestureDetector(
      onTap: () {},
      child: Stack(alignment: Alignment.center, children: [
        // Transparent Container
        Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.only(top: 55.h),

            // Colored Container
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: agentColors[agent.displayName!.toLowerCase()] ??
                        [
                          CupertinoColors.destructiveRed,
                          CupertinoColors.black
                        ]),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              alignment: Alignment.bottomLeft,
              width: 160.w,

              // Agent info column
              child: Padding(
                padding: EdgeInsets.all(5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      agent.role!.displayName!,
                      style: TextStyle(
                          fontFamily: 'Valorant',
                          color: white,
                          fontSize: 10.sp),
                    ),
                    Text(
                      agent.displayName!,
                      style: TextStyle(
                          fontFamily: 'Valorant',
                          color: white,
                          fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Agent Image
        Positioned(
            child: Hero(
                tag: agent,
                child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: agent.fullPortraitV2??''))),
      ]),
    );
  }
}
