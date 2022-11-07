import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/modals/profilemodal.dart';
import 'package:mixago_music/screens/profilescreen.dart';

import 'package:mixago_music/screens/settings.dart';
import 'package:share_plus/share_plus.dart';

Widget drawerfunction(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  Box<UserProfile> userdata = getprofilebox();

  return Drawer(
    backgroundColor: Color.fromARGB(0, 0, 0, 0),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(150), topRight: Radius.circular(1)),
        gradient: LinearGradient(
          colors: [Color.fromARGB(0, 17, 8, 24), Color.fromARGB(255, 0, 0, 0)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.1, 0.6],
          tileMode: TileMode.repeated,
        ),
      ),
      // color: Colors.black.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        // bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(197, 52, 13, 21),
                        Color.fromARGB(134, 35, 3, 53)
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.2, 0.8],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  height: size.height * 0.194,
                  child: ValueListenableBuilder(
                    valueListenable: userdata.listenable(),
                    builder: (BuildContext context, Box<UserProfile> value,
                        Widget? child) {
                      final userprofile = userdata.get('user');
                      final name =
                          userprofile == null ? 'user' : userprofile.username;
                      final image = userprofile == null
                          ? 'asset/img/blank-profile-picture-973460_1280.webp'
                          : userprofile.userimage;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 36, 36, 35),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: size.height * 0.100,
                            width: size.width * 0.210,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: image ==
                                        'asset/img/blank-profile-picture-973460_1280.webp'
                                    ? Image.asset(fit: BoxFit.cover, image)
                                    : Image.file(
                                        fit: BoxFit.cover, File(image)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.01,
                            ),
                            child: name == null
                                ? Text(
                                    'Hey User...',
                                    style: TextStyle(
                                        fontSize: size.width * 0.05,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    'Hey ${name.toString()}...',
                                    style: TextStyle(
                                        fontSize: size.width * 0.05,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return profilescreen();
                    },
                  ));
                },
                child: ListTile(
                  leading: Icon(Icons.account_box_outlined,
                      color: Colors.white.withOpacity(0.7)),
                  title: Text(
                    'Profile',
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                  trailing: Icon(Icons.navigate_next_rounded,
                      color: Colors.white.withOpacity(0.7)),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info_outline,
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
                  onTap: () async {
                    // await Share.share( );
                  },
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
