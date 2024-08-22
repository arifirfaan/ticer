// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:dio/dio.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:newpppp/dashboard_page.dart';
// import 'package:newpppp/profile_page.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MasjidPage extends StatefulWidget {
//   const MasjidPage({super.key});

//   @override
//   State<MasjidPage> createState() => MasjidPageState();
// }

// class MasjidPageState extends State<MasjidPage> {
//   final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
//   LatLng? _currentPosition;
//   bool _isLoading = true;
//   List<Place> _places = [];

//   @override
//   void initState() {
//     super.initState();
//     _currentPosition = const LatLng(37.42796133580664, -122.085749655962);
//     _requestPermissions();
//   }

//   @override
//   void dispose(){
//     super.dispose();
//   }

//   Future<void> _requestPermissions() async {
//     PermissionStatus gpsPermission = await Permission.location.request();

//     if (gpsPermission.isGranted) {
//       await getLocation();
//       await fetchNearbyMasjids();
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   Future<void> getLocation() async {
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     double lat = position.latitude;
//     double long = position.longitude;

//     LatLng location = LatLng(lat, long);

//     setState(() {
//       _currentPosition = location;
//       _isLoading = false;
//     });
//   }

//   Future<void> fetchNearbyMasjids() async {
//     if (_currentPosition == null) return;

//     const apiKey = 'AIzaSyDr64tr-Y3YopYDi7PmbUou96Q0o3wSYlI';
//     const radius = 5000; // 5 km
//     const type = 'mosque';
//     final url =
//         'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${_currentPosition!.latitude},${_currentPosition!.longitude}&radius=$radius&type=$type&key=$apiKey';

//     try {
//       Response response = await Dio().get(url);

//       if (response.statusCode == 200) {
//         final data = response.data;
//         //debugPrint(" LIST MASJID : " + data['results']);
//         final List<Place> places = (data['results'] as List).map((placeJson) => Place.fromJson(placeJson)).toList();
//         setState(() {
//           _places = places;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void _launchMaps(Place place) async {
//     final googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=${place.lat},${place.lng}';
//     final Uri googleMapsUri = Uri.parse(googleMapsUrl);

//     if (await canLaunchUrl(googleMapsUri)) {
//       await launchUrl(googleMapsUri);
//     } else {
//       throw 'Could not launch $googleMapsUrl';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("SolatDulu", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Expanded(
//                 child: _isLoading
//                     ? const Center(child: CircularProgressIndicator())
//                     : GoogleMap(
//                         mapType: MapType.hybrid,
//                         myLocationEnabled : true,
//                         initialCameraPosition: CameraPosition(
//                           target: _currentPosition!,
//                           zoom: 14.4746,
//                         ),
//                         onMapCreated: (GoogleMapController controller) {
//                           _controller.complete(controller);
//                         },
//                       ),
//               ),
//               SizedBox(
//                 height: 300,
//                 child: _places.isEmpty
//                     ? const Center(child: Text("No masjid found nearby."))
//                     : ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: _places.length,
//                         itemBuilder: (context, index) {
//                           final place = _places[index];
//                           return ListTile(
//                             title: Text(place.name),
//                             subtitle: Text(place.vicinity),
//                             onTap: () => _launchMaps(place),
//                           );
//                         },
//                       ),
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 20,
//             child: Container(
//               width: 190,
//               margin: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width-190)/2),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 8, 29, 66),
//                 borderRadius: BorderRadius.circular(10)
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     onPressed: (){
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const DropdownButtonExample()));
//                     }, icon: const Column(
//                       children: [
//                         Icon(Icons.timelapse_sharp, color: Colors.white),
//                         Text("Waktu", style: TextStyle(color: Colors.white))
//                       ],
//                     )
//                   ),
//                   IconButton(
//                     onPressed: (){
//                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const MasjidPage()));
//                     }, icon: const Column(
//                       children: [
//                         Icon(Icons.mosque, color: Colors.white),
//                         Text("Masjid", style: TextStyle(color: Colors.white))
//                       ],
//                     )
//                   ),
//                   IconButton(
//                     onPressed: (){
//                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const ProfilePage()));
//                     }, icon: const Column(
//                       children: [
//                         Icon(Icons.person_pin, color: Colors.white),
//                         Text("Profile", style: TextStyle(color: Colors.white),)
//                       ],
//                     )
//                   )
//                 ],
//               ),
//             )
//           )
//         ],
//       ),
//     );
//   }

// }

// class Place {
//   final String name;
//   final String vicinity;
//   final double lat;
//   final double lng;

//   Place({required this.name, required this.vicinity, required this.lat, required this.lng});

//   factory Place.fromJson(Map<String, dynamic> json) {
//     return Place(
//       name: json['name'],
//       vicinity: json['vicinity'],
//       lat: json['geometry']['location']['lat'],
//       lng: json['geometry']['location']['lng'],
//     );
//   }
// }
