import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/database_function.dart';

ceateplaylistalert(
    {required BuildContext context,
    required TextEditingController createplaylistcontroller}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: const Color.fromARGB(0, 255, 193, 7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: 330,
              child: Column(
                children: [
                  Expanded(
                    child: GlassContainer(
                      borderRadius: BorderRadius.circular(25),
                      blur: 2,
                      color:
                          const Color.fromARGB(148, 11, 0, 0).withOpacity(0.6),
                      child: Column(
                        children: [
                          const Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Create Your Playlist',
                              style:
                                  TextStyle(fontSize: 19, color: Colors.white),
                            ),
                          )),
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'asset/img/music.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: createplaylistcontroller,
                              style: TextStyle(color: Colors.grey.shade400),
                              autofocus: true,
                              decoration: InputDecoration(
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade700),
                                hintText: "Enter Playlist Name",
                                labelStyle: TextStyle(color: Color(0xFF424242)),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const GlassContainer(
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text('Cancel'),
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              createplaylist(
                                  createplaylistcontroller:
                                      createplaylistcontroller);
                              Navigator.pop(context);
                            },
                            child: const GlassContainer(
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text('Create'),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      });
}

createplaylist(
    {required TextEditingController createplaylistcontroller}) async {
  Box<List> playlisthivebox = getplaylistbox();
  final myplaylistname = createplaylistcontroller.text;

  log(myplaylistname.toString());
  await playlisthivebox.put(myplaylistname, []);
  log(playlisthivebox.length.toString());
  createplaylistcontroller.clear();
}
