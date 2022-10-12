import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_test_task/presentation/ui/cubit/map_markers_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<MapMarkersCubit, MapMarkersState>(
        builder: (context, state) {
          return FlutterMap(
            options: MapOptions(
              center: LatLng(53.90522, 27.55386),
              zoom: 13,
              interactiveFlags: ~InteractiveFlag.rotate,
              onMapReady: () => context.read<MapMarkersCubit>().updateMarkers(),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.map_test_task',
              ),
              MarkerLayer(
                markers: [
                  ...state.markers
                      .map((model) => Marker(
                            point: LatLng(model.lat, model.lng),
                            builder: (context) => const FlutterLogo(),
                          ))
                      .toList(),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
