import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:skdoosh/res/app_color.dart';

class VenuMap extends StatefulWidget {
  const VenuMap({super.key});

  @override
  State<VenuMap> createState() => _VenuMapState();
}

class _VenuMapState extends State<VenuMap> {
  late GoogleMapController _controller;
  Position? _currentPosition;
  String _selectedLocation = '';
  String _lat_lng='';
  Map data={};

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
  }

  Future<void> get(LatLngBounds value) async {
    final lon = (value.northeast.longitude + value.southwest.longitude) / 2;
    final lat = (value.northeast.latitude + value.southwest.latitude) / 2;
    print(lat);
    print(lon);
    setState(() {
      _selectedLocation = '$lat : $lon';
      _lat_lng= '$lat : $lon';
    });
    // _selectedLocation=
    List<Placemark> newPlace = await placemarkFromCoordinates(lat, lon);
    if (newPlace.isNotEmpty) {
      // this is all you need
      Placemark placeMark = newPlace[0];
      String? name = placeMark.name;
      String? subLocality = placeMark.subLocality;
      String? locality = placeMark.locality;
      String? administrativeArea = placeMark.administrativeArea;
      String? postalCode = placeMark.postalCode;
      String? country = placeMark.country;
      String address =
          "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
      print(address);
      setState(() {
        _selectedLocation = address; // update _address
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          width: double.infinity,
          height: double.infinity,
          child: _currentPosition != null
              ? GoogleMap(
                  onCameraIdle: () {
                    Future<LatLngBounds> bounds =
                        _controller.getVisibleRegion();
                    bounds.then((value) => {get(value)});
                    //final lon = (bounds.northeast.longitude + bounds.southwest.longitude) / 2;
                    //final lat = (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
                    //print(lat);
                    //print(lon);
                  },
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(_currentPosition!.latitude,
                        _currentPosition!.longitude),
                    zoom: 15,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId("current_location"),
                      position: LatLng(_currentPosition!.latitude,
                          _currentPosition!.longitude),
                      infoWindow: InfoWindow(title: "Your Location"),
                    ),
                  },
                )
              : Center(child: CircularProgressIndicator()),
        ),
        Center(
            child: Icon(
          Icons.location_pin,
          size: 45,
          color: AppColor.primaryBg,
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 160,
            width: double.infinity,
            color: Colors.white,
            child: Card(
              elevation: 1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Select Venue Location ',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  Text(
                    _selectedLocation,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final data = { "location" : _lat_lng, "place" : _selectedLocation };
                        Navigator.pop(context, data);
                      },
                      child: Text('Confirm'),
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.homecolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
