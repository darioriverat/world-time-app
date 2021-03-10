import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    setUpTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
            child: SpinKitWave(
              color: Colors.white,
              size: 60,
            )
        ),
      ),
    );
  }

  void setUpTime() async {
    WorldTime worldTime = new WorldTime();
    await worldTime.setTime('Bogota', 'America/Bogota');

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'time': worldTime.time,
      'isDayTime' : worldTime.isDayTime
    });
  }
}
