import 'package:flutter/material.dart';
import 'package:mixago_music/screens/homescreen.dart';
import 'package:slider_button/slider_button.dart';

class splashtwo extends StatefulWidget {
  const splashtwo({
    super.key,
    required this.myAudiolist,
  });
  final myAudiolist;

  @override
  State<splashtwo> createState() => _splashtwoState();
}

class _splashtwoState extends State<splashtwo> {
  // double sizeheight = 0;
  // double sizewidth = 0;
  // double bottumpage = 0;

  int pagestate = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 44),
                  child: Text(
                    'Hey Hello',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 33,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 26),
                  child: Text(
                    ' welcome to your Music Player enjoy man Lets go on your Player',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Center(
                    child: Image.asset(
                        'asset/img/—Pngtree—day of dead dia de_8715605.png')),
                Center(
                    child: SliderButton(
                        vibrationFlag: true,
                        //  baseColor: Colors.red,
                        // buttonColor: Colors.green,
                        //  highlightedColor: Colors.amber,
                        height: 60,
                        action: () {
                          ///Do something here
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen(myAudiolist: widget.myAudiolist);
                          }));
                        },
                        label: const Text(
                          "Slide to Home page",
                          style: TextStyle(
                              color: Color(0xff4a4a4a),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        icon: Icon(Icons.home))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
