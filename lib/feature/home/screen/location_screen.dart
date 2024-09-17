// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:fashion_app/core/config/localstorage.dart';
import 'package:geocoding/geocoding.dart';

import 'package:fashion_app/feature/share/sized_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/resources/app_color.dart';

class MarkerDate {
  final LatLng position;

  MarkerDate({
    required this.position,
  });
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

StreamSubscription<Position>? positionStream;

class _LocationScreenState extends State<LocationScreen> {
  final MapController mapController = MapController();
  List<Marker> marker = [];
  // ignore: prefer_final_fields
  List<MarkerDate> _markerdate = [];
  LatLng? selectPosition;

  LatLng? myLocation;
  bool isDragging = false;
  LatLng? draggedPosition;
  TextEditingController search = TextEditingController();
  List<dynamic> searchResults = [];
  bool isSearching = false;
//!for my location
  void showCurrentLocation() async {
    try {
      Position position = await getCurrentLocationApp();
      LatLng currrntLatLng = LatLng(position.latitude, position.longitude);
      mapController.move(currrntLatLng, 18.0);
      setState(() {
        myLocation = currrntLatLng;
      });
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        final address =
            '${placemark.country}, ${placemark.locality}, ${placemark.subLocality}';
        print('Current location: $address');
        getIt.get<SharedPreferences>().setString('address', address);
      }
      print(placemarks);
    } catch (e) {
      print(e);
    }
  }

  //!add marker on selected location
  void addMarker(
    LatLng position,
  ) {
    setState(() {
      final markerdate = MarkerDate(
        position: position,
      );
      _markerdate.add(markerdate);
      marker.add(Marker(
          point: position,
          child: GestureDetector(
            child: Icon(
              Icons.location_on,
              color: AppColor.primary,
              size: 50,
            ),
            onTap: () {},
          ),
          width: 80,
          height: 80));
    });
  }

//!Search feature
  Future<void> searchPlaces(String query) async {
    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
      return;
    }
    final url =
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=5';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.isNotEmpty) {
        setState(() {
          searchResults = data;
        });
      } else {
        setState(() {
          searchResults = [];
        });
      }
    } else {
      print('Failed to load data...........');
    }
  }

//!movie to specific location
  void moveToLocation(double lat, double lon) {
    LatLng location = LatLng(lat, lon);
    mapController.move(location, 18.0);
    setState(() {
      selectPosition = location;
      searchResults = [];
      isSearching = false;
      MarkerLayer(markers: [
        Marker(
            point: LatLng(lat, lon),
            width: 80,
            height: 80,
            child: Icon(
              Icons.location_on,
              color: AppColor.primary,
            )),
      ]);
      //  search.clear();
    });
  }

  getCurrentLocationApp() async {
    bool serviceEnabled;
    LocationPermission permission;
    //!للتاكد انو خدمة الموقع عل الموبايل شغالة
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      print('trun onnn');
    }
    //!لحتى اعطي صلاحية للتطبيق
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition();
    }
  }

  @override
  void initState() {
    super.initState();
    search.addListener(
      () {
        searchPlaces(search.text);
      },
    );
    showCurrentLocation();
    getCurrentLocationApp();
  }

  @override
  void dispose() {
    if (positionStream != null) {
      positionStream!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: const LatLng(32.883942, -6.930680),
          initialZoom: 13.0,
          onTap: (tapPosition, latlng) {
            selectPosition = latlng;
            draggedPosition = selectPosition;
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(markers: marker),
          if (isDragging && draggedPosition != null)
            MarkerLayer(markers: [
              Marker(
                  point: draggedPosition!,
                  width: 80,
                  height: 80,
                  child: Icon(
                    Icons.location_on,
                    color: AppColor.primary,
                  )),
            ]),
          if (myLocation != null)
            MarkerLayer(
              markers: [
                Marker(
                    point: myLocation!,
                    width: 80,
                    height: 80,
                    child: Icon(
                      Icons.location_on,
                      color: AppColor.primary,
                      size: 45,
                    ))
              ],
            ),
        ],
      ),
      Positioned(
        bottom: 240,
        right: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: showCurrentLocation,
            child: Container(
                width: 34.w,
                height: 34.h,
                decoration: BoxDecoration(
                    color: AppColor.primarylight.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.location_searching_rounded)),
          ),
        ),
      ),
      Positioned(
        bottom: 15,
        right: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox_Height(height: 10.h),
              Container(
                width: 300.w,
                height: 160.h,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.primarylight.withOpacity(0.7)),
                child: Column(
                  children: [
                    SizedBox_Height(height: 7.h),
                    InkWell(
                      onTap: () {
//                         Navigator.pushNamed(
//   context,
//   '/home',
//   arguments: Placemark(),
// );
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor:
                                    AppColor.primarylight.withOpacity(0.7),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('bottom');
                                  },
                                  child: Container(
                                    width: 200.w,
                                    height: 70.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox_Height(height: 10.h),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${getIt.get<SharedPreferences>().getString('address')}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(
                                                      color:
                                                          AppColor.textcolor),
                                            ),
                                            Icon(
                                              Icons.location_on,
                                              color: AppColor.primary,
                                            ),
                                          ],
                                        ),
                                        SizedBox_Height(height: 7.h),
                                        Container(
                                          width: 30.w,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                              color: AppColor.primary
                                                  .withOpacity(0.7),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Icon(
                                            Icons.check,
                                            color: AppColor.textcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: AppColor.secondary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            SizedBox_width(width: 7.w),
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColor.primary,
                            ),
                            Text(
                              'Use My Crrunet Location',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: AppColor.titlecolor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox_Height(height: 7.h),
                    Text(
                      'OR',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppColor.titlecolor),
                    ),
                    SizedBox(
                      height: 54.h,
                      width: 300.w,
                      child: Center(
                        child: TextFormField(
                          cursorColor: AppColor.primary,
                          onTap: () {
                            setState(() {
                              isSearching = true;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: 'Choose Location',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: AppColor.titlecolor),
                              fillColor: AppColor.secondary,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColor.primary,
                              ),
                              suffixIcon: isSearching
                                  ? IconButton(
                                      onPressed: () {
                                        search.clear();
                                        (setState(() {
                                          isSearching = false;
                                          searchResults = [];
                                        }));
                                      },
                                      icon: const Icon(Icons.clear))
                                  : null),
                          controller: search,
                        ),
                      ),
                    ),
                    SizedBox_Height(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      if (isSearching && searchResults.isNotEmpty)
        Positioned(
          bottom: 220,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primarylight.withOpacity(0.7),
            ),
            //height: 60.h,
            width: 350,
            child: Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final place = searchResults[index];
                    return SizedBox(
                      height: 50.h,
                      width: 900,
                      child: ListTile(
                        title: Text(
                          place['display_name'].toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          final lat = double.parse(place['lat'].toString());
                          final lon = double.parse(place['lon'].toString());
                          print(place['lat'].toString());
                          print(place['lon'].toString());

                          moveToLocation(lat, lon);
                          addMarker(
                            LatLng(lat, lon),
                          );
                        },
                      ),
                    );
                  }),
            ),
          ),
        ),
    ]));
  }
}
