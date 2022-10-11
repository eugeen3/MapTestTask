// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:map_test_task/data/model/supplier.dart';

class MarkerModel {
  MarkerModel({
    required this.lat,
    required this.lng,
    required this.suppliers,
  });

  factory MarkerModel.fromJson(dynamic response) {
    return MarkerModel(
      lat: response['lat'],
      lng: response['lng'],
      suppliers: (response['suppliers'] as List<dynamic>)
          .map((supplier) => SupplierModel.fromJson(supplier))
          .toList(),
    );
  }

  double lat;
  double lng;
  List<SupplierModel> suppliers;

  @override
  String toString() => 'Marker(lat: $lat, lng: $lng, suppliers: $suppliers)';

  @override
  bool operator ==(covariant MarkerModel other) {
    if (identical(this, other)) return true;

    return other.lat == lat &&
        other.lng == lng &&
        listEquals(other.suppliers, suppliers);
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode ^ suppliers.hashCode;
}
