// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:map_test_task/data/models/supplier.dart';

class Marker {
  Marker({
    required this.lat,
    required this.lng,
    required this.suppliers,
  });

  factory Marker.fromJson(dynamic response) {
    return Marker(
      lat: response['lat'],
      lng: response['lng'],
      suppliers: (response['suppliers'] as List<dynamic>)
          .map((supplier) => Supplier.fromJson(supplier))
          .toList(),
    );
  }

  double lat;
  double lng;
  List<Supplier> suppliers;

  @override
  String toString() => 'Marker(lat: $lat, lng: $lng, suppliers: $suppliers)';

  @override
  bool operator ==(covariant Marker other) {
    if (identical(this, other)) return true;

    return other.lat == lat &&
        other.lng == lng &&
        listEquals(other.suppliers, suppliers);
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode ^ suppliers.hashCode;
}
