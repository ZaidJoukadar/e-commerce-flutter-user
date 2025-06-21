import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getpolyline(current_lat, current_long, target_lat, target_long) async {
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineset = {};
  var point;
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$current_lat,$current_long&destination=$target_lat,$target_long&key=AIzaSyAU0ndyKBkVOe7nLRuUpLyzmTTqo-06Uv0";

  var response = await http.post(Uri.parse(url));
  var response_body = jsonDecode(response.body);
  if (response_body['status'] == 'OK') {
    point = response_body['routes'][0]['overview_polyline']['points'];
  } else {
    print('not esifdsjfil');
    print(url);
  }

  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }
  Polyline polyline = Polyline(
      polylineId: PolylineId('target'),
      color: Colors.purple,
      width: 5,
      points: polylineco);
  polylineset.add(polyline);

  return polylineset;
}
