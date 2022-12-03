import 'package:flutter/material.dart';

class licenses extends StatelessWidget {
  const licenses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LicensePage(
      applicationVersion: 'Version 1.0.0',
      applicationName: 'MIXAGO',
      applicationIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 80,
          width: 100,
          child:
              Image.asset('asset/img/music-and-sound-logo-design-vector 2.png'),
        ),
      ),
    );
  }
}
