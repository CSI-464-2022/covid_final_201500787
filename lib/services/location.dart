import 'package:covid_final/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VaccinationSites extends StatefulWidget {
  const VaccinationSites({Key? key}) : super(key: key);

  @override
  _VaccinationSitesState createState() => _VaccinationSitesState();
}

class _VaccinationSitesState extends State<VaccinationSites> {
  late GoogleMapController controller;
  late String markerroute;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarker(specify, specifyId) async {
    if (kDebugMode) {
      print("Specify: $specify");
    }
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(specify['location'].latitude, specify['location'].longitude),
      infoWindow: InfoWindow(
        title: specify['service'],
        snippet: specify['name'],
      ),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() async {
    FirebaseFirestore.instance.collection('map').get().then((myMapData) {
      if (myMapData.docs.isNotEmpty) {
        for (int i = 0; i < myMapData.docs.length; i++) {
          if (kDebugMode) {
            print(myMapData.docs[i].data().toString());
          }
          initMarker(myMapData.docs[i].data(), myMapData.docs[i].id);
          markerroute = myMapData.docs[i].id;
        }
      }
    });
  }

  @override
  void initState() {
    getMarkerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccine/Testing Centers'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        /**actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            iconSize: 28.0,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProfilePage(),),);
            },
          ),
        ],*/
      ),
      body: GoogleMap(
        markers: Set<Marker>.of(markers.values),
        mapType: MapType.hybrid,
        initialCameraPosition: const CameraPosition(
          target: LatLng(-24.656635342047444, 25.90700837954302),
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          controller = controller;
        },
      ),
    );
  }
}
