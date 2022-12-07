import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlist/playlist_bloc.dart';
import 'package:mixago_music/presentaion/screen%20playlist/widgets/delete_confom_shett.dart';

playlistsbottansheet({required BuildContext context, required String key}) {
  TextEditingController renameplaylistcontroll =
      TextEditingController(text: key);
  var isEditing = true;
  final size = MediaQuery.of(context).size;
  return showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: const Color.fromARGB(0, 223, 157, 157),
      context: context,
      builder: (BuildContext context) {
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
                      padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
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
                            padding: const EdgeInsets.all(14),
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
                              BlocProvider.of<PlaylistBloc>(context).add(
                                  Renameplaylists(
                                      key: key,
                                      textcntrol: renameplaylistcontroll));

                              // playlistrename(
                              //     key: key,
                              //     textcntrol: renameplaylistcontroll,
                              //     context: context);
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
                              // setState(
                              //   () {
                              if (isEditing == true) {
                                isEditing = false;
                              } else {
                                isEditing = true;
                              }
                              //   },
                              // );
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
