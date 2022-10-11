import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
      body: Center(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(53.90522, 27.55386),
            zoom: 13,
            interactiveFlags: ~InteractiveFlag.rotate,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.map_test_task',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(53.95, 27.6),
                  width: 30,
                  height: 30,
                  builder: (context) => const FlutterLogo(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
