import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
   
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    const CameraPosition inicialPoint = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), // scan.getLatLng(),
      zoom: 17.5,
      tilt: 50
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordinates'),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: mapType,
        //markers: markers,
        initialCameraPosition: inicialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}