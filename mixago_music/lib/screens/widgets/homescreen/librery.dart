import 'dart:ui';

import 'package:flutter/material.dart';

library(
    {required String libraryimg,
    libraryname,
    required myontap,
    required context}) {
  final size = MediaQuery.of(context).size;
  return Stack(
    children: [
      Container(
        //padding: EdgeInsets.all(.3),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 140,
        width: size.width * 0.50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: GestureDetector(
            onTap: myontap,
            // () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const Favorite()),
            //   );
            // },
            child: Image.asset(
              libraryimg,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
              height: 30,
              width: size.width * 0.70,
              child: Text(
                libraryname,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
              ),
            ),
          ),
        ),
      )
    ],
  );
}
