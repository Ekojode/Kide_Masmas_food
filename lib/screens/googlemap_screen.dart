import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:masmas_food/provider/direction_provider.dart';
import '../models/directions_model.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  static const routeName = '/googlemapscreen';
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  Marker? _userLocation;
  Marker? _restaurantLocation;
  Directions? _info;

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(6.640711970164805, 3.369001995300256),
    zoom: 11.5,
  );

  getLocationPermission() async {
    var location = Location();
    location.requestPermission();
  }

  @override
  void initState() {
    getLocationPermission();
    // setUpMarker();
    super.initState();
  }

// TODO: dispose google controller
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            myLocationButtonEnabled: false,
            onMapCreated: _onMapCreated,
            markers: {
              if (_userLocation != null) _userLocation!,
              if (_restaurantLocation != null) _restaurantLocation!
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info!.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                )
            },
            onLongPress: _addMarker,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 5,
          backgroundColor: Colors.teal[200],
          onPressed: () async {
            final GoogleMapController mapController = await _controller.future;
            mapController.animateCamera(_info != null
                ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
                : CameraUpdate.newCameraPosition(_initialCameraPosition));
          },
          child: const Icon(Icons.layers)),
    ));
  }

// TODO: why must LatLng pos be here?
  void _addMarker(LatLng pos) async {
    var restuarantPos = const LatLng(6.640711970164805, 3.369001995300256);
    var userPos = const LatLng(6.640834994467693, 3.359652103020689);

    setState(() {
      _userLocation =
          Marker(markerId: const MarkerId("Your Location"), position: userPos);
    });

    setState(() {
      _restaurantLocation = Marker(
        markerId: const MarkerId("Restaurant Location"),
        position: restuarantPos,
      );
    });

    final directions = await DirectionsRepository().getDirections(
        userLocation: _userLocation!.position,
        restaurantLocation: _restaurantLocation!.position);
    setState(() {
      _info = directions;
      print('info asfdfsdfsd');
    });
  }
}
