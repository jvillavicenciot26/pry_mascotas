import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: cGreyColor,
        ), //IconButton(icon: Icons.bac),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-8.11403443221283, -79.00578005010047),
          zoom: 12,
        ),
      ),
    );
  }
}
