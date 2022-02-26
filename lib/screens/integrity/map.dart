import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: const GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(6.738936168016046, 80.01019700543186),
            zoom: 8,
            
          ),
        ),
      ),
    );
  }
}
