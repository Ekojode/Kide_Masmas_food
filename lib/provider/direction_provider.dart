import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/directions_model.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;
// TODO: make dio required
  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirections({
    required LatLng userLocation,
    required LatLng restaurantLocation,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'userLocation': '${userLocation.latitude}, ${userLocation.longitude}',
        'restaurantLocation':
            '${restaurantLocation.latitude}, ${restaurantLocation.longitude}',
        'key': "AIzaSyA-755z4-icKgZp775LQ8oOABmvebrnmo0"
      },
    );
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
