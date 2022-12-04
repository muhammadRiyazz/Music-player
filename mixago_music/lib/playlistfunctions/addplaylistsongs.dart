import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlist/playlist_bloc.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../screens/widgets/miniplayer.dart';

addsongplaylist({required BuildContext ctxt, required String keys}) {
  Box<List> playlistbox = getplaylistbox();
  final size = MediaQuery.of(ctxt).size;
  var myvisible = false;

  return showModalBottomSheet(
      backgroundColor: const Color.fromARGB(0, 185, 32, 32),
      context: ctxt,
      isScrollControlled: true,
      builder: (BuildContext context) {
        Box<Musics> songlisbox = getsongsmodalbox();
        List<Musics> mysongslist = songlisbox.values.toList();
        return Padding(
          padding: EdgeInsets.only(
            left: size.height * 0.01,
            right: size.height * 0.01,
          ),
          //  bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GlassContainer(
                color: Colors.black.withOpacity(0.6),
                blur: 5,
                borderRadius: BorderRadius.circular(10),
                height: size.height * 0.60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 5, top: 15, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'All SONGS',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            '${mysongslist.length.toString()} Songs',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    // ValueListenableBuilder(
                    //   valueListenable: playlistbox.listenable(),
                    //   builder: (BuildContext context, Box<List> value,
                    //       Widget? child) {
                    //     return
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: (mysongslist.isEmpty)
                            ? const Center(
                                child: Text('No Songs'),
                              )
                            : ListView.builder(
                                itemCount: mysongslist.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      onTap: () {
                                        myminiplayer(
                                            context: context,
                                            myAudiolist: mysongslist,
                                            index: index);
                                      },
                                      contentPadding: EdgeInsets.zero,
                                      leading: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: QueryArtworkWidget(
                                          artworkBorder:
                                              BorderRadius.circular(13),
                                          id: int.parse(mysongslist[index].id),
                                          type: ArtworkType.AUDIO,
                                          nullArtworkWidget: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.asset(
                                              'asset/img/music.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        mysongslist[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      subtitle: Text(
                                        mysongslist[index].artist,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      trailing: iconchange(
                                        keys: keys,
                                        id: mysongslist[index].id,
                                        context: ctxt,
                                      ));
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.011,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: GlassContainer(
                  borderRadius: BorderRadius.circular(10),
                  blur: 5,
                  color: Colors.black54.withOpacity(0.5),
                  height: size.height * 0.05,
                  width: double.infinity,
                  child: const Center(child: Text('Cancel')),
                ),
              ),
              SizedBox(
                height: size.height * 0.011,
              ),
            ],
          ),
        );
      });
}

songaddtoplaylist(
    {required String keys,
    required String id,
    required BuildContext context}) async {
  log('add function call');
  Box<Musics> allsongbox = getsongsmodalbox();
  Box<List> playlistbox = getplaylistbox();
  List<Musics> allsongslist = [];

  allsongslist = allsongbox.values.toList();

  final List<Musics> Playlistsongs =
      playlistbox.get(keys)!.toList().cast<Musics>();

  final selectedsong = allsongslist.firstWhere(
    (song) => song.id.contains(id),
  );

  if (Playlistsongs.where((song) => selectedsong.id == song.id).isEmpty) {
    Playlistsongs.add(selectedsong);

    await playlistbox.put(keys, Playlistsongs);
    BlocProvider.of<PlaylistBloc>(context).add(Playlists());
    log('sonhhhhhh');

    // ignore: use_build_context_synchronously
    showTopSnackBar(
        context,
        CustomSnackBar.success(
            textScaleFactor: 0.8,
            iconPositionLeft: 1,
            backgroundColor: const Color.fromARGB(255, 24, 24, 33),
            messagePadding: EdgeInsets.zero,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            message: 'Added To $keys'.toUpperCase()));
  } else {
    Playlistsongs.removeWhere((element) => element.id == id);
    await playlistbox.put(keys, Playlistsongs);
    BlocProvider.of<PlaylistBloc>(context).add(Playlists());
    log('bloc  last song');

    // ignore: use_build_context_synchronously
    showTopSnackBar(
        context,
        CustomSnackBar.info(
            textScaleFactor: 0.8,
            iconPositionLeft: 1,
            backgroundColor: const Color.fromARGB(255, 24, 24, 33),
            messagePadding: EdgeInsets.zero,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            message: 'REMOVED FROM $keys'.toUpperCase()));

    log('seected song  remove to list');
    log(Playlistsongs.length.toString());
  }
}

Widget iconchange(
    {required String id, required String keys, required BuildContext context}) {
  Box<Musics> allsongbox = getsongsmodalbox();
  Box<List> playlistbox = getplaylistbox();
  List<Musics> allsongslist = [];

  allsongslist = allsongbox.values.toList();

  // ignore: non_constant_identifier_names
  final List<Musics> Playlistsongs =
      playlistbox.get(keys)!.toList().cast<Musics>();

  final selectedsong = allsongslist.firstWhere(
    (song) => song.id.contains(id),
  );

  if (Playlistsongs.where((song) => selectedsong.id == song.id).isEmpty) {
    return IconButton(
        onPressed: () {
          songaddtoplaylist(
            keys: keys,
            id: id,
            context: context,
          );
        },
        icon: const Icon(
          Icons.add_box_outlined,
          color: Colors.grey,
        ));
  } else {
    // Playlistsongs.removeWhere((song) => song.id == id);
    return IconButton(
        onPressed: () {
          songaddtoplaylist(
            keys: keys,
            id: id,
            context: context,
          );
        },
        icon: const Icon(
          Icons.indeterminate_check_box_outlined,
          color: Colors.grey,
        ));
  }
}
