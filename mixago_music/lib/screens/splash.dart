import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mixago_music/screens/homescreen.dart';
import 'package:permission_handler/permission_handler.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    tohomescreen();
  }

  tohomescreen() async {
    await Permission.storage.request();
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFF030312),
          child: Center(
              child: Stack(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                  curve: Curves.elasticOut,
                  duration: Duration(seconds: 9),
                  opacity: 1,
                  child: Image.asset('asset/img/logo_samp.png')),
              Positioned(
                top: 120,
                left: 38,
                child: AnimatedOpacity(
                    curve: Curves.elasticOut,
                    duration: Duration(seconds: 9),
                    opacity: 1,
                    child: Image.asset('asset/img/MIXAGO.png')),
              )
            ],
          ))),
    );
  }
}
