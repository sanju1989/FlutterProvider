import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skdoosh/res/app_color.dart';
import 'package:skdoosh/res/component/RoundButton.dart';
import 'package:skdoosh/res/routes/routes_name.dart';
import 'package:skdoosh/utils/Utils.dart';
import 'package:skdoosh/view/home/MainScreen.dart';
import 'package:skdoosh/view/venue/bankingvenuescreen.dart';
import 'package:skdoosh/view/venue/venu_map.dart';
import '../../data/response/status.dart';
import '../../view_models/venu_view_model.dart';

const LatLng currentLocation = LatLng(20.5937, 78.9629);

class VenueDetails extends StatefulWidget {
  const VenueDetails({super.key});

  @override
  State<VenueDetails> createState() => _VenueDetails();
}

class _VenueDetails extends State<VenueDetails> {
  VenuViewModel venueViewModel = VenuViewModel();
  final TextEditingController _venueNameController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  FocusNode _venueNameFocus = FocusNode();
  FocusNode _addressLine1Focus = FocusNode();
  FocusNode _addressLine2Focus = FocusNode();
  FocusNode _pincodeFocus = FocusNode();

  late GoogleMapController _controller;
  Position? _currentPosition;
  String _selectedLocation = 'Choose Location on map';
  String _lat_lng='';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';
  var cntryDropdownvalue;
  var stateDropdownvalue;
  var cityDropdownValue;

  @override
  void initState() {
    super.initState();
    stateDropdownvalue = '1';
    cntryDropdownvalue = '1';
    cityDropdownValue = '1';
    venueViewModel.fetchCountry();
    Map data = {
      'country_id': '1',
    };
    venueViewModel.fetchStates(data, context);
    _getCurrentLocation();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.signinpage,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create a new venue",
                    style: TextStyle(fontFamily: "Inter", fontSize: 35),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Venue details",
                    style: TextStyle(
                      fontFamily: "Inter",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    controller: _venueNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Venue Name',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    controller: _addressLine1Controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Address line 1',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    controller: _addressLine2Controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Address line 2',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  height: 50,
                  //child: CountryDropdown(),

                  child: ChangeNotifierProvider<VenuViewModel>(
                      create: (BuildContext context) => venueViewModel,
                      child:
                          Consumer<VenuViewModel>(builder: (context, value, _) {
                        //debugPrint(value.cntryList.status.toString());
                        switch (value.cntryList.status) {
                          case Status.LOADING:
                            return SizedBox(
                              height: 50,
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            );
                          case Status.ERROR:
                            return Text(value.cntryList.message.toString());
                          case Status.COMPLETED:
                            debugPrint(
                                value.cntryList.data!.data!.length.toString());
                            List<DropdownMenuItem<String>> s = List.generate(
                              value.cntryList.data!.data!.length,
                              (index) => DropdownMenuItem(
                                value: value
                                    .cntryList.data!.data![index].countryId
                                    .toString(),
                                child: Text(
                                    "${value.cntryList.data!.data![index].country}"),
                              ),
                            );

                            // _popularMovieList(value);
                            return DropdownButton(
                              icon: const Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              items: s,
                              value: cntryDropdownvalue,
                              onChanged: (value) {
                                setState(() {
                                  cntryDropdownvalue = value.toString();
                                });
                              },

                              // onChanged: (Object? value) {
                              //   cntryDropdownvalue = value.toString();
                              //   Map data={
                              //     'country_id': '1',
                              //   };
                              //  // venueViewModel.fetchStates(data, context);
                              // },
                            );
                          default:
                            return const Text("Hata");
                        }
                      })),
                  // child: DropdownButton(
                  //   value: dropdownvalue,
                  //   icon: const Icon(Icons.keyboard_arrow_down),
                  //   items: items.map((String items) {
                  //     return DropdownMenuItem(
                  //       value: items,
                  //       child: Text(items),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? newValue){
                  //     setState(() {
                  //
                  //     });
                  //   },
                  // ),
                  // child: TextField(
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     hintText: 'Country',
                  //   ),
                  //   keyboardType: TextInputType.text,
                  // ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  height: 50,
                  // child: StateDropdown(),
                  child: ChangeNotifierProvider<VenuViewModel>(
                      create: (BuildContext context) => venueViewModel,
                      child:
                          Consumer<VenuViewModel>(builder: (context, value, _) {
                        debugPrint(value.stateList.status.toString());
                        switch (value.stateList.status) {
                          case Status.LOADING:
                            return SizedBox(
                              height: 50,
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            );
                          case Status.ERROR:
                            return Text(value.stateList.message.toString());
                          case Status.COMPLETED:
                            debugPrint(
                                value.stateList.data!.data!.length.toString());
                            List<DropdownMenuItem<String>> s = List.generate(
                              value.stateList.data!.data!.length,
                              (index) => DropdownMenuItem(
                                value: value
                                    .stateList.data!.data![index].stateId
                                    .toString(),
                                child: Text(
                                    "${value.stateList.data!.data![index].state}"),
                              ),
                            );

                            // _popularMovieList(value);
                            return DropdownButton<String>(
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: s,
                              value: stateDropdownvalue,
                              onChanged: (value) {
                                debugPrint(value.toString());
                                setState(() {
                                  stateDropdownvalue = value.toString();
                                  Map data = {
                                    'state_id': stateDropdownvalue,
                                  };
                                  venueViewModel.fetchCities(data, context);
                                });
                              },
                            );
                          default:
                            return const Text("Hata");
                        }
                      })),
                  // child: TextField(
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     hintText: 'Province / State / UT',
                  //   ),
                  //   keyboardType: TextInputType.text,
                  // ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 15, right: 6),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 175,
                        height: 50,
                        child: ChangeNotifierProvider<VenuViewModel>(
                            create: (BuildContext context) => venueViewModel,
                            child: Consumer<VenuViewModel>(
                                builder: (context, value, _) {
                              debugPrint(value.cityList.status.toString());
                              switch (value.cityList.status) {
                                case Status.LOADING:
                                  return SizedBox(
                                    height: 50,
                                    child: const Center(
                                        child: CircularProgressIndicator()),
                                  );
                                case Status.ERROR:
                                  return Text(
                                      value.cityList.message.toString());
                                case Status.COMPLETED:
                                  debugPrint(value.cityList.data!.data!.length
                                      .toString());
                                  // _popularMovieList(value);
                                  return DropdownButton(
                                    isExpanded: true,
                                    value: cityDropdownValue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items:
                                        value.cityList.data!.data!.map((item) {
                                      return DropdownMenuItem(
                                        value: item.cityId.toString(),
                                        child: Text(item.city.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      debugPrint(value.toString());
                                      cityDropdownValue = value.toString();
                                    },
                                  );
                                default:
                                  return const Text("Hata");
                              }
                            }))
                        /*child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Town / City ',
                        ),
                        keyboardType: TextInputType.text,
                      ),*/
                        ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 100,
                      height: 50,
                      child: TextField(
                        controller: _pincodeController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pincode',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Location: $_selectedLocation',
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'FontInter'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8.0, right: 8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              abc();
                              //getVenueLocation(context);
                            },
                            child: Text('click here'),
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.homecolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            )),
                      )
                    ],
                  ),
                  /* child: _currentPosition != null
                      ? GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                      zoom: 15,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId("current_location"),
                        position: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                        infoWindow: InfoWindow(title: "Your Location"),
                      ),
                    },
                  ) : Center(child: CircularProgressIndicator()),*/
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const MainScreen();
                                },
                              ),
                                  (_) => false,
                            );
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                fontSize: 12, color: AppColor.blackcolor),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.homecolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 65,
                        width: 150,
                        child: RoundButton(
                          radius: 30,
                          title: 'Next (1/2)',
                          loading: venueViewModel.loading,
                          onPress: () {
                          if (_venueNameController.text.isEmpty) {
                            Utility.snackBar('Venue Name required', context);
                          } else if (_addressLine1Controller.text.isEmpty) {
                            Utility.snackBar(
                                'Address1 Name required', context);
                          } else if (_addressLine2Controller.text.isEmpty) {
                            Utility.snackBar(
                                'Address2 Name required', context);
                          } else if (cntryDropdownvalue == null ||
                              cntryDropdownvalue.toString().isEmpty) {
                            Utility.snackBar('Country required', context);
                          } else if (stateDropdownvalue == null ||
                              stateDropdownvalue.toString().isEmpty) {
                            Utility.snackBar('State required', context);
                          } else if (cityDropdownValue == null ||
                              cityDropdownValue.toString().isEmpty) {
                            Utility.snackBar('City Name required', context);
                          } else if (_pincodeController.text.isEmpty) {
                            Utility.snackBar('Pin code required', context);
                          } else if (_lat_lng.isEmpty) {
                            Utility.snackBar('Location required', context);
                          } else {
                            Map data={
                              "venue_name":_venueNameController.text.toString(),
                              "address1":_addressLine1Controller.text.toString(),
                              "address2":_addressLine2Controller.text.toString(),
                              "city_id":"2",
                              "pincode":_pincodeController.text.toString(),
                              "google_coordinates":_lat_lng,
                              "business_id":"1"
                            };
                            venueViewModel.addVenueApi(data, context);

                          }
                        },

                          // child: Text(
                          //   'Next (1/3)',
                          //   style: TextStyle(fontSize: 12, color: Colors.white),
                          // ),
                          // style: ElevatedButton.styleFrom(
                          //   primary: AppColor.blackcolor,
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(25)),
                          // ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> abc() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    } else {
      getVenueLocation(context);
    }
  }

  Future<void> getVenueLocation(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => VenuMap()));
    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
    setState(() {
      debugPrint(result.toString());
      debugPrint('result=${result['location']}');
      debugPrint('result--${result['place']}');
      _lat_lng=result['location'];
      if(result['place']==null || result['place'].toString().isEmpty){
        _selectedLocation=result['location'];
      }
      else{
        _selectedLocation = result['place'];
      }
    });
  }
}
