import 'package:flutter/material.dart';

import 'package:mixago_music/screens/homescreen.dart';
import 'package:mixago_music/screens/mostplayed.dart';
import 'package:mixago_music/screens/nowplaying.dart';
import 'package:mixago_music/screens/playlist.dart';
import 'package:mixago_music/screens/settings.dart';
import 'package:mixago_music/screens/splash.dart';

void main(List<String> args) {
  runApp(Mixago());
}

class Mixago extends StatefulWidget {
  const Mixago({super.key});

  @override
  State<Mixago> createState() => _MixagoState();
}

class _MixagoState extends State<Mixago> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.white.withOpacity(0.8)),
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          //headline1: TextStyle(color: Colors.deepPurpleAccent),
          //headline2: TextStyle(color: Colors.deepPurpleAccent),
          bodyText2: TextStyle(
              // fontFamily: ,

              color: Colors.grey.shade300),
          //subtitle1: TextStyle(color: Colors.pinkAccent),
        ),
      ),
      home: Splash(),
    );
  }
}
