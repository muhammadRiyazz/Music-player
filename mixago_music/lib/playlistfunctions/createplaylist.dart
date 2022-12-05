import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlist/playlist_bloc.dart';

ceateplaylistalert(
    {required BuildContext context,
    required TextEditingController createplaylistcontroller}) {
  final size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: const Color.fromARGB(0, 255, 193, 7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: size.height * 0.5,
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
                            height: size.height * 0.2,
                            width: size.width * 0.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'asset/img/music.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.2),
                            child: TextField(
                              controller: createplaylistcontroller,
                              style: TextStyle(color: Colors.grey.shade400),
                              autofocus: true,
                              decoration: InputDecoration(
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade700),
                                hintText: "Enter Playlist Name",
                                labelStyle:
                                    const TextStyle(color: Color(0xFF424242)),
                                border: const UnderlineInputBorder(
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
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<PlaylistBloc>(context).add(
                                  Createplaylists(
                                      textcntrol: createplaylistcontroller));
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
