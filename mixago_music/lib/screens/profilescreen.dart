import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/modals/profilemodal.dart';
import 'package:mixago_music/profilefunctions/editprofile.dart';

class profilescreen extends StatelessWidget {
  profilescreen({super.key});
  Box<UserProfile> userdata = getprofilebox();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey.shade500),
        backgroundColor: Colors.black,
      ),
      body: ValueListenableBuilder(
        valueListenable: userdata.listenable(),
        builder: (BuildContext context, Box<UserProfile> value, Widget? child) {
          final userprofile = value.get('user');

          final name = userprofile == null ? 'user' : userprofile.username;
          final image = userprofile == null
              ? 'asset/img/blank-profile-picture-973460_1280.webp'
              : userprofile.userimage;

          return Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(22),
                        bottomLeft: Radius.circular(22)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 26, 12, 38),
                        Color.fromARGB(255, 0, 0, 0)
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.1, 0.8],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: SizedBox(
                          height: size.height * 0.24,
                          width: size.width * 0.55,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: image ==
                                    'asset/img/blank-profile-picture-973460_1280.webp'
                                ? Image.asset(
                                    fit: BoxFit.cover,
                                    'asset/img/blank-profile-picture-973460_1280.webp')
                                : Image.file(fit: BoxFit.cover, File(image)),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          name.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return profileeditpage(
                                myname: name.toString(),
                                myimg: image.toString(),
                              );
                            },
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height * 0.09),
                            child: Container(
                              height: size.height * 0.067,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 26, 12, 38),
                                    Color.fromARGB(255, 47, 43, 43)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  stops: [0.2, 0.8],
                                  tileMode: TileMode.repeated,
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )),
            ],
          );
        },
      ),
    );
  }
}
