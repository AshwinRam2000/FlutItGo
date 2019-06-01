import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gmaps/forum.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/map": (bc) => MapSample(),
        "/forum": (bc) => ForumPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(curLat, curLong),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  static double curLat = 12.905552;
  static double curLong = 77.602046;

  @override
  void initState() {
    super.initState();
  }

  static MarkerId markerId = MarkerId("123");

  // creating a new MARKER
  final Marker marker = Marker(
    markerId: markerId,
    position: LatLng(curLat, curLong),
    infoWindow: InfoWindow(title: "123", snippet: '*'),
    onTap: () {},
  );
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers.values.toSet(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/chat");
                },
                icon: Icon(Icons.chat)),
            title: Text("Chat"),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/forum");
                },
                icon: Icon(Icons.forum)),
            title: Text("Forum"),
          )
        ],
      ),
      // ],
    );
  }
}
