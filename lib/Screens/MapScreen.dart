
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final String selectedLocation;
  final Set<Marker> markers;
  const MapScreen({
    Key? key,
    required this.selectedLocation,
    required this.markers,
  }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    // Initialize the markers using widget.markers
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
             _mapController = controller;
          });
        },
        markers: widget.markers,
      ),
    );
  }
}
