import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/maps_cubit.dart';
import 'maps_card_widget.dart';

class ListMaps extends StatelessWidget {
  const ListMaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is MapsLoading) {
          return Expanded(
              child: Center(
                  child: Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator())));
        }
        if (state is MapsLoaed) {
          return Expanded(
              child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  itemCount: state.maps?.length,
                  itemBuilder: (context, index) {
                    return MapsCard(map: state.maps![index]);
                  }));
        }
        return Container();
      },
    );
  }
}