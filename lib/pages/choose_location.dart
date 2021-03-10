import 'package:flutter/material.dart';
import 'package:world_time/constants/flags.dart';
import 'package:world_time/constants/zones.dart';
import 'package:world_time/location.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<Location> locations = [
    Location(name: 'Toronto', flag: Flags.CAN, zone: Zones.CAN),
    Location(name: 'Sydney', flag: Flags.AUT, zone: Zones.AUT),
    Location(name: 'Paris', flag: Flags.FRA, zone: Zones.FRA),
    Location(name: 'Bogota', flag: Flags.COL, zone: Zones.COL),
    Location(name: 'Madrid', flag: Flags.ESP, zone: Zones.ESP),
    Location(name: 'Tokyo', flag: Flags.JPN, zone: Zones.JPN),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () async {
                  Navigator.pop(context, await locations[index].toMap());
                },
                title: Text(locations[index].name),
                leading: Image(image: locations[index].getFlag()),
              ),
            ),
          );
        },
      ),
    );
  }
}
