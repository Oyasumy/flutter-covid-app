import 'package:covid_app/widgets/customeMap.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

showMarker(icon, provinces) {
  Set<Marker> markers = {};
  for (var pro in provinces) {
    markers.add(Marker(
      markerId: MarkerId('${pro.province}' ?? null),
      infoWindow: InfoWindow(
          title: '${pro.province}' ?? null,
          snippet: 'Infected case: ${pro.provinceCase}' ?? null),
      icon: icon,
      position: LatLng(pro.positive[0] ?? 0, pro.positive[1] ?? 0),
      anchor: Offset(0.5, 0.6),
    ));
  }
  return markers;
}

showCircle(provinces) {
  Set<Circle> circles = {};
  for (var pro in provinces) {
    var colors = createColor(pro.provinceCase);
    // print('coclor $colors');
    circles.add(
      Circle(
        circleId: CircleId('${pro.province}' ?? null),
        radius: createRadius(pro.provinceCase),
        // center: _createCenter,
        fillColor: colors[0] ?? null,
        strokeColor: colors[1] ?? null,
        onTap: () {
          print('circle pressed');
        },
        center: LatLng(pro.positive[0] ?? 0, pro.positive[1] ?? 0),
        strokeWidth: 1,

        // radius: 4000,
      ),
    );
  }
  return circles;
}
