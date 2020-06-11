import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now;
  String bgImage = 'evening.jpg';
  Map data = {'location': 'Tashkent', 'time': '12:00 AM'};
  int seconds = 0;

  void updateTime() {
    setState(() {
      seconds += 1;
      if (seconds == 60) {
        seconds = 0;
        now = DateTime.now().add(Duration(hours: data['timeDifference']));
        data['time'] = intl.DateFormat.jm().format(now);

        if (now.hour == 7 || now.hour == 20) {
          data['isDaytime'] = (now.hour > 6 && now.hour < 20);
          bgImage = data['isDaytime'] ? 'day.png' : 'evening.jpg';
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      data = ModalRoute.of(context).settings.arguments;
      now = data['DateTime'];
      bgImage = data['isDaytime'] ? 'day.png' : 'evening.jpg';
      seconds = DateTime.now().second;
      updateTime();
      seconds -= 1;
      Timer.periodic(Duration(seconds: 1), (Timer t) => updateTime());
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _onWillPop();
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/backgrounds/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.grey[200]),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 100),
                          FlatButton.icon(
                            onPressed: () async {
                              dynamic result = await Navigator.pushNamed(
                                  context, '/location',
                                  arguments: data);
                              print(result);
                              setState(() {
                                data = result ?? data;
                                bgImage = data['isDaytime']
                                    ? 'day.png'
                                    : 'evening.jpg';
                              });
                            },
                            icon: Icon(
                              Icons.edit_location,
                              size: 30,
                              color: Colors.grey[200],
                            ),
                            label: Text(
                              data['location'],
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 30,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            data['time'],
                            style: TextStyle(
                              fontSize: 66,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            seconds.toString(),
                            style: TextStyle(
                              fontSize: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
