import 'package:covid_app/Modal/Province.dart';
import 'package:covid_app/service/province.dart';
import 'package:covid_app/widgets/showProvinces.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGoogleScreen extends StatefulWidget {
  @override
  _MapGoogleScreenState createState() => _MapGoogleScreenState();
}

class _MapGoogleScreenState extends State<MapGoogleScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(10.806806, 106.636116), zoom: 7);

// create map controler
  GoogleMapController _googleMapController;
// create current position
  Position currentPosition;
// create Geolocator
  var geolocator = Geolocator();
  // custome marker
  BitmapDescriptor customIcon1;
  Set<Marker> markers = {};
  Set<Circle> circles = {};
  // call api
  List<Province> _provinces;
  bool loading;

// get current location
  void locatePostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    currentPosition = position;

    LatLng latLng = LatLng(currentPosition.latitude, currentPosition.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLng, zoom: 15);

    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  void initState() {
    super.initState();

    // call api
    loading = true;
    ProvinceService.getProvinces().then((value) {
      setState(() {
        _provinces = value;
        loading = false;
        //  set custome marker
        setCustomeMarker();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _googleMapController.dispose();
    super.dispose();
  }

  void setCustomeMarker() async {
    customIcon1 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
            // size: Size(24, 24),
            ),
        "assets/images/chip.png");
    setState(() {
      if (loading == false) {
        markers = showMarker(customIcon1, _provinces);
        circles = showCircle(_provinces);
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("GG Map"), centerTitle: true, actions: [
          TextButton(
            onPressed: () {},
            child: TextButton(
              onPressed: () => _googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(_initialCameraPosition)),
              child: Text('ORIGIN'),
              style: TextButton.styleFrom(
                  primary: Colors.cyan,
                  textStyle: TextStyle(fontWeight: FontWeight.w600)),
            ),
          )
        ]),
        body: GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            indoorViewEnabled: false,
            tiltGesturesEnabled: false,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            circles: circles,
            markers: markers),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          onPressed: () => locatePostion(),
          child: Icon(Icons.center_focus_strong),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
