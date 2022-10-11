import 'dart:io';

import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:map_test_task/data/graphql_client.dart';
import 'package:map_test_task/data/model/marker.dart';

@singleton
class MapMarkersRepository {
  final GraphQLClient client = GraphQLClientProvider().getClient();

  Future<List<Marker>> getMarkers() async {
    final QueryOptions options = QueryOptions(
      document: gql(
        r'''
        { map_markers
    ( general:
        {   language:"by",
            city:"minsk",
            country:"by",
            subscription:"platinum",
            activity:[],
            tag:[]}, 
    leftTopPoint: { 
        lat: 53.90921759901524, 
        lng: 27.537789344787598}, 
    centerPoint:{
        lat: 53.906044719797165, 
        lng: 27.55598545074463}) 
        { 
            lat lng suppliers { id name } 
        }
        }
      ''',
      ),
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      stderr.writeln(result.exception.toString());
      return [];
    }

    final List<dynamic> markersJson =
        result.data?['map_markers'] as List<dynamic>;
    final List<Marker> markers = [];
    for (var f in markersJson) {
      {
        markers.add(Marker.fromJson(f));
      }
    }

    return markers;
  }
}
