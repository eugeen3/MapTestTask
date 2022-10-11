import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:map_test_task/data/model/marker.dart';
import 'package:map_test_task/data/repository/map_objects_repository.dart';

part 'map_markers_state.dart';

@injectable
class MapMarkersCubit extends Cubit<MapMarkersState> {
  MapMarkersCubit(
    this._mapMarkersRepository,
  ) : super(MapMarkersState());

  final MapMarkersRepository _mapMarkersRepository;

  void updateMarkers() async {
    final markers = await _mapMarkersRepository.getMarkers();

    emit(state.copyWith(markers: markers));
  }
}
