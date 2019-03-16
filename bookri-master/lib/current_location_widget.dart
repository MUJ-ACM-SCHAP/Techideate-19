import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import 'common_widgets/placeholder_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

import 'package:geohash/geohash.dart';

final DocumentReference user1 =
Firestore.instance.collection('users').document(user);

class LocationStreamWidget extends StatefulWidget {
  @override
  State<LocationStreamWidget> createState() => LocationStreamState();
}

class LocationStreamState extends State<LocationStreamWidget> {
  StreamSubscription<Position> _positionStreamSubscription;
  Position _positions = Position();

  void listen(){
    const LocationOptions locationOptions =
    LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);
    final Stream<Position> positionStream =
    Geolocator().getPositionStream(locationOptions);
    _positionStreamSubscription = positionStream.listen(
            (Position position) => setState(() => _positions=position));
    _positionStreamSubscription.resume();
  }

  @override
  void dispose() {
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription.cancel();
      _positionStreamSubscription = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    listen();
    return FutureBuilder<GeolocationStatus>(
        future: Geolocator().checkGeolocationPermissionStatus(),
        builder:
            (BuildContext context, AsyncSnapshot<GeolocationStatus> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == GeolocationStatus.denied) {
            return const PlaceholderWidget('Location services disabled',
                'Enable location services for this App using the device settings.');
          }
          location(_positions);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Latitude: ' + _positions.latitude.toString(),style: TextStyle(fontSize: 16, color: Colors.orangeAccent, fontWeight: FontWeight.bold),),
              Text('Longitude: ' + _positions.longitude.toString(),style: TextStyle(fontSize: 16, color: Colors.orangeAccent, fontWeight: FontWeight.bold),),
            ],
          );
        });
  }
  void location(Position _position) {
    user1.get().then((dataSnapshot) {
      if (dataSnapshot.exists) {
        Map<String, double> latitude = <String, double>{
          "Latitude": _position.latitude
        };
        Map<String, double> longitude = <String, double>{
          "Longitude": _position.longitude
        };
        user1.updateData(latitude);
        user1.updateData(longitude);
      } else {
      }
    });
  }
}

