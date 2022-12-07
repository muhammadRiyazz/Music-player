import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlist/playlist_bloc.dart';

deleteplaylistalert({required String key, required BuildContext context}) {
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
                              BlocProvider.of<PlaylistBloc>(context)
                                  .add(Deleteplaylists(key: key));
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
