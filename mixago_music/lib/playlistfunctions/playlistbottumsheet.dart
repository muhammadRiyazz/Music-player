import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/library%20add%20functions/addfavourite.dart';
import 'package:mixago_music/modals/Musics.dart';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:share_plus/share_plus.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../modals/database_function.dart';

bottansheetinplaylistlisttile(
    {required BuildContext cxt,
    required List<Musics> myaudiolist,
    required int index,
    required String key}) {
  final size = MediaQuery.of(cxt).size;

  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: const Color.fromARGB(0, 223, 157, 157),
      context: cxt,
      builder: (BuildContext context) {
        Box<List> librarybox = getlibrarybox();
        return Container(
          // height: ,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            GlassContainer(
              borderRadius: BorderRadius.circular(25),
              blur: 5,
              color: Colors.black54.withOpacity(0.5),
              //height: size.height * 0.47,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: size.height * 0.20,
                    width: size.width * 0.54,
                    child: QueryArtworkWidget(
                      artworkFit: BoxFit.cover,
                      artworkBorder: BorderRadius.circular(13),
                      id: int.parse(myaudiolist[index].id),
                      type: ArtworkType.AUDIO,
                      nullArtworkWidget: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'asset/img/music.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.5,
                    child: Center(
                      child: Text(
                        myaudiolist[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: size.width * 0.4,
                      child: Center(
                        child: Text(myaudiolist[index].artist,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13)),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      songremove(
                          id: myaudiolist[index].id, key: key, context: cxt);
                      Navigator.pop(context);
                    },
                    iconColor: Colors.grey,
                    textColor: Colors.grey,
                    title: const Text(
                      'Remove From Playlist',
                    ),
                    leading: const Icon(Icons.playlist_remove),
                  ),
                  ValueListenableBuilder(
                    valueListenable: librarybox.listenable(),
                    builder:
                        (BuildContext context, Box<List> value, Widget? child) {
                      return textfvrtaddremove(
                          id: myaudiolist[index].id, snakctxt: context);
                    },
                  ),
                  ListTile(
                    onTap: () async {
                      await Share.share('..');
                    },
                    iconColor: Colors.grey,
                    textColor: Colors.grey,
                    title: const Text('Share'),
                    leading: const Icon(Icons.ios_share_outlined),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: GlassContainer(
                borderRadius: BorderRadius.circular(14),
                blur: 5,
                color: Colors.black54.withOpacity(0.5),
                height: size.height * 0.05,
                width: double.infinity,
                child: const Center(child: Text('Cancel')),
              ),
            ),
            SizedBox(height: size.height * 0.01),
          ]),
        );
      });
}

songremove(
    {required String id,
    required String key,
    required BuildContext context}) async {
  log('call function');
  Box<Musics> allsongbox = getsongsmodalbox();
  Box<List> playlistbox = getplaylistbox();

  // List keysList = playlistbox.keys.toList();

  List<Musics> allsongslist = allsongbox.values.toList();

  final List<Musics> Playlistsongs =
      playlistbox.get(key)!.toList().cast<Musics>();
  log(Playlistsongs.length.toString());
  log('playlist to list');

  log('selected song id checkkkk');
  Playlistsongs.removeWhere((element) => element.id == id);
  await playlistbox.put(key, Playlistsongs);

  log(Playlistsongs.length.toString());
  // ignore: use_build_context_synchronously
  showTopSnackBar(
      context,
      CustomSnackBar.error(
          iconPositionLeft: 1,
          textScaleFactor: 0.8,
          backgroundColor: Color.fromARGB(255, 24, 24, 33),
          messagePadding: EdgeInsets.zero,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          message: 'REMOVED FROM $key'.toUpperCase()));

  log('remove');
}
