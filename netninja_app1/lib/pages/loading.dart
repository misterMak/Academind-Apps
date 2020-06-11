import 'package:flutter/material.dart';
import 'package:netninja_app1/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime time = WorldTime(
        location: 'Berlin',
        url: 'Europe/Berlin',
        flag: 'assets/flags/germany.png');
    await time.getTime();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: time.data);
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'WORLD TIME',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 100),
          SpinKitFadingCube(
            color: Colors.white,
            size: 80.0,
          ),
        ],
      ),
    );
  }
}
