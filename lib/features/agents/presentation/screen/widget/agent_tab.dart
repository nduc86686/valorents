import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/app_colors.dart';
import '../../cubit/agent_cubit.dart';

class AgentTab extends StatefulWidget {
  const AgentTab({Key? key}) : super(key: key);

  @override
  State<AgentTab> createState() => _AgentTabState();
}

class _AgentTabState extends State<AgentTab> {
  // Agent Filter List
  var agentFilters = [
    'All',
    'Duelist',
    'Sentinel',
    'Initiator',
    'Controller',
  ];
  int indexTab=0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: agentFilters.length,
        itemBuilder: (context, index) {
          return LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.all(Platform.isAndroid
                  ? 8.w
                  :
              // iPhone 7 - 38 and iPhone 5S - SE 1. Gen - 32
              constraints.maxHeight.round() == 38 ||
                  constraints.maxHeight.round() == 32
                  ? 7.h
                  :
              // Others
              10.w),
              // Gesture detector for index update
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    indexTab=index;
                  });
                  context.read<AgentCubit>().changeTab(index: index,role: agentFilters[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // If box selected bg color red and text color white
                      // If box unselected bg color white and text color black
                      color: indexTab == index
                          ? CupertinoColors.systemRed
                          : CupertinoColors.white),
                  width: 100.w,
                  alignment: Alignment.center,
                  child: Text(
                    agentFilters[index],
                    style: TextStyle(
                        color: indexTab == index ? white : black,
                        fontFamily: 'Valorant',
                        fontSize: 10.5.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}