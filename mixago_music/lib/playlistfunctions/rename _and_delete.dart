import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlist/playlist_bloc.dart';

import '../modals/Musics.dart';
import '../modals/database_function.dart';

playlistsbottansheet({required BuildContext context, required String key}) {
  TextEditingController renameplaylistcontroll =
      TextEditingController(text: key);
  log('call bottam sheeet');
  var isEditing = false;
  final size = MediaQuery.of(context).size;
  return showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: const Color.fromARGB(0, 223, 157, 157),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: ((context, setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GlassContainer(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              blur: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 26, 12, 38),
                        Color.fromARGB(255, 0, 0, 0)
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.2, 0.8],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, right: 5, left: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            Container(
                              // color: Colors.black,
                              padding: EdgeInsets.all(14),
                              height: size.height * 0.21,
                              width: size.width * 0.54,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    fit: BoxFit.cover, 'asset/img/music.jpg'),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                playlistrename(
                                    key: key,
                                    textcntrol: renameplaylistcontroll,
                                    context: context);
                                Navigator.pop(context);
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        ),
                      ),
                      isEditing
                          ? renametextfeald(
                              key: key, rename: renameplaylistcontroll)
                          : playlistname(keyname: key),
                      Padding(
                        padding: const EdgeInsets.all(17),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    if (isEditing == true) {
                                      isEditing = false;
                                    } else {
                                      isEditing = true;
                                    }
                                  },
                                );
                              },
                              child: const ListTile(
                                title: Text(
                                  'Rename',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                leading: Icon(
                                    Icons.drive_file_rename_outline_rounded,
                                    color: Colors.grey),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                deleteplaylistalert(key: key, context: context);
                              },
                              child: const ListTile(
                                title: Text(
                                  'Delete Play List',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                leading: Icon(Icons.delete_sweep_outlined,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
      });
}

Widget playlistname({required String keyname}) {
  return Text(
    keyname,
    style: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.grey.shade500, fontSize: 16),
  );
}

Widget renametextfeald(
    {required String key, required TextEditingController rename}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: TextField(
      controller: rename,
      style: TextStyle(color: Colors.grey.shade600),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade800.withOpacity(0.5),
        filled: true,
        prefixIcon:
            Icon(color: Colors.grey.shade100, Icons.drive_file_rename_outline),
      ),
    ),
  );
}

deleteplaylist({required String key, required BuildContext context}) {
  Box<List> playlisthivebox = getplaylistbox();
  playlisthivebox.delete(key);
  BlocProvider.of<PlaylistBloc>(context).add(const Playlists());

  log('Delete');
  log(playlisthivebox.length.toString());
}

deleteplaylistalert({required String key, required BuildContext context}) {
  log('alert function call');
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Dialog(
            backgroundColor: const Color.fromARGB(0, 255, 193, 7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), //this right here
            child: SizedBox(
              height: size.height * 0.2,
              child: Column(
                children: [
                  Expanded(
                    child: GlassContainer(
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(15),
                        blur: 2,
                        //color: Color.fromARGB(54, 11, 0, 0).withOpacity(0.1),
                        child: const Center(child: Text('Are You Sure?'))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
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
                                padding: EdgeInsets.symmetric(vertical: 7),
                                child: Text('Cancel'),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              deleteplaylist(key: key, context: context);
                              Navigator.pop(context);
                            },
                            child: const GlassContainer(
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 7),
                                child: Text('Delete'),
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

playlistrename(
    {required String key,
    required TextEditingController textcntrol,
    required BuildContext context}) {
  String renamenewtext = textcntrol.text;
  Box<List> playlisthivebox = getplaylistbox();
  final List<Musics> Playlistsongs =
      playlisthivebox.get(key)!.toList().cast<Musics>();
  log('new rename');
  List<Musics> renameplaylistsong = Playlistsongs;
  playlisthivebox.delete(key);
  log('new rename');
  playlisthivebox.put(renamenewtext, renameplaylistsong);
  BlocProvider.of<PlaylistBloc>(context).add(const Playlists());
  log('new rename');
}
