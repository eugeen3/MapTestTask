import 'dart:io';

import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:map_test_task/data/model/marker.dart';

@singleton
class MapMarkersRepository {
  MapMarkersRepository(this.client);

  final GraphQLClient client;

  Future<List<MarkerModel>> getMarkers() async {
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
        lat: 53.96941513194737, 
        lng: 27.41899815788326}, 
    centerPoint:{
        lat: 53.90440700905252, 
        lng: 27.5541348391629}) 
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
    final List<MarkerModel> markers = [];
    for (var f in markersJson) {
      {
        markers.add(MarkerModel.fromJson(f));
      }
    }

    return markers;
  }
}
