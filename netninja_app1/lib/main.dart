import 'package:flutter/material.dart';
import 'package:netninja_app1/pages/choose_location.dart';
import 'package:netninja_app1/pages/home.dart';
import 'package:netninja_app1/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
//   theme: ThemeData(
//     primaryTextTheme: Typography.material2018(platform: TargetPlatform.iOS).white,
//     textTheme: Typography.material2018(platform: TargetPlatform.iOS).white,
// ),
    ));
