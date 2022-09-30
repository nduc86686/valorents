import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valo/features/map/domain/use_cases/map_usecase.dart';

import '../../../../src/core/usecase/usecase.dart';
import '../../domain/entities/map.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapUseCase mapUseCase;

  MapsCubit({
    required this.mapUseCase,
  }) : super(MapsInitial());

  Future<void> loadMap() async {
    emit(MapsLoading());
    await Future.delayed(const Duration(seconds: 1));
    final map = await mapUseCase(NoParams());
    map.fold(
      (left) => emit(MapsFail()),
      (right) {
        emit(MapsLoaed(maps: right));
      },
    );
  }
}
