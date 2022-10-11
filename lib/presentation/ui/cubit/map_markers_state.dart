part of 'map_markers_cubit.dart';

class MapMarkersState {
  MapMarkersState({
    this.markers = const [],
  });

  final List<MarkerModel> markers;

  MapMarkersState copyWith({
    List<MarkerModel>? markers,
  }) {
    return MapMarkersState(
      markers: markers ?? this.markers,
    );
  }

  @override
  String toString() => 'MapMarkersState(markers: $markers)';

  @override
  bool operator ==(covariant MapMarkersState other) {
    if (identical(this, other)) return true;
    return listEquals(other.markers, markers);
  }

  @override
  int get hashCode => markers.hashCode;
}
