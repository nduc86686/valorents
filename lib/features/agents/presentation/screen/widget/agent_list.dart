import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../app_router.dart';
import '../../cubit/agent_cubit.dart';
import '../../cubit/agent_state.dart';
import 'agent_card.dart';

class AgentListWidget extends StatelessWidget {
  const AgentListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentCubit, AgentsStates>(
      builder: (context, state) {
        if (state is AgentsLoaded) {
          return Expanded(
            flex: 11,
            child: GridView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 2.4),
              itemCount: state.agents!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.detailt_agent);
                  },
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: AgentsCard(
                      agent: state.agents![index],
                      index: index,
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Expanded(
            flex:11,child: CircularProgressIndicator());
      },
    );
  }
}