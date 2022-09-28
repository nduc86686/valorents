import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/constants/app_colors.dart';

import 'widget/widget_agent.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
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
              const AgentTab(),

              const AgentListWidget()
            ],
          ),
        ),
      ),
    );
  }
}






