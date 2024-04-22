import 'package:flutter/material.dart';
import 'package:ftolo2_project_3/animation_screen.dart';
import 'Home.dart';

void main() {
  runApp(FlutterFragments());
}

class FlutterFragments extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Nation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/widget': (context) => AnimationScreen(animation: "animation", bg: "images/soccerbackground.jpg", type: "implicit", bgColor: Colors.white,),
      },
    );
  }
}
