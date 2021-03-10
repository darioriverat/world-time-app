import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'], style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2
                    )),
                  ],
                ),
                SizedBox(height: 20),
                Text(data['time'], style: TextStyle(
                  fontSize: 66
                ))
              ],
            ),
          )
      )
    );
  }
}
