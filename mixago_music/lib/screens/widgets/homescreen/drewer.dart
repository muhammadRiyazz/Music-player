import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mixago_music/screens/favorite.dart';
import 'package:mixago_music/screens/mostplayed.dart';
import 'package:mixago_music/screens/nowplaying.dart';
import 'package:mixago_music/screens/settings.dart';

Widget drawerfunction(BuildContext context) {
  return Drawer(
    backgroundColor: Color.fromARGB(0, 0, 0, 0),
    child: GlassContainer(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(150), topRight: Radius.circular(1)),
      blur: 5,
      color: Colors.black.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(children: [
          SizedBox(
            height: 70,
          ),
          Image.asset('asset/img/MIXAGO.png'),
          SizedBox(
            height: 55,
          ),
          ListTile(
            leading: Icon(Icons.account_box_outlined,
                color: Colors.white.withOpacity(0.7)),
            title: Text(
              'About',
              style: TextStyle(color: Colors.white.withOpacity(0.7)),
            ),
            trailing: Icon(Icons.navigate_next_rounded,
                color: Colors.white.withOpacity(0.7)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
            child: ListTile(
              leading: Icon(Icons.settings_applications,
                  color: Colors.white.withOpacity(0.7)),
              title: Text(
                'settings',
                style: TextStyle(color: Colors.white.withOpacity(0.7)),
              ),
              trailing: Icon(Icons.navigate_next_rounded,
                  color: Colors.white.withOpacity(0.7)),
            ),
          ),
          ListTile(
              leading: Icon(Icons.ios_share_rounded,
                  color: Colors.white.withOpacity(0.7)),
              title: Text(
                'Share',
                style: TextStyle(color: Colors.white.withOpacity(0.7)),
              ),
              trailing: Icon(
                Icons.navigate_next_rounded,
                color: Colors.white.withOpacity(0.7),
              )),
        ]),
      ),
    ),
  );
}

// width: 250,
// backgroundColor: Color.fromARGB(255, 51, 16, 71).withOpacity(0.0),
// child: ListView(
//   padding: EdgeInsets.zero,
//   children: [
//     Center(
//       child: DrawerHeader(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 55,
//             ),
//             Image.asset('asset/img/MIXAGO.png'),
//           ],
//         ),
//       ),
//     ),
//     GlassContainer(
//       child: Column(children: [
//         ListTile(
//           leading: Icon(Icons.account_box_outlined,
//               color: Colors.white.withOpacity(0.7)),
//           title: Text(
//             'About',
//             style: TextStyle(color: Colors.white.withOpacity(0.7)),
//           ),
//           trailing: Icon(Icons.navigate_next_rounded,
//               color: Colors.white.withOpacity(0.7)),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const Settings()),
//             );
//           },
//           child: ListTile(
//             leading: Icon(Icons.settings_applications,
//                 color: Colors.white.withOpacity(0.7)),
//             title: Text(
//               'settings',
//               style: TextStyle(color: Colors.white.withOpacity(0.7)),
//             ),
//             trailing: Icon(Icons.navigate_next_rounded,
//                 color: Colors.white.withOpacity(0.7)),
//           ),
//         ),
//         ListTile(
//             leading: Icon(Icons.ios_share_rounded,
//                 color: Colors.white.withOpacity(0.7)),
//             title: Text(
//               'Share',
//               style: TextStyle(color: Colors.white.withOpacity(0.7)),
//             ),
//             trailing: Icon(
//               Icons.navigate_next_rounded,
//               color: Colors.white.withOpacity(0.7),
//             )),
//       ]),
//     ),
//   ],
// ),
