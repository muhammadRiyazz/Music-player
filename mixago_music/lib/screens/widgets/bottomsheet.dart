// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/library%20add%20functions/addfavourite.dart';
import 'package:mixago_music/modals/Musics.dart';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import 'package:mixago_music/screens/playlistpage.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:share_plus/share_plus.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../modals/database_function.dart';

bottansheet(
    {required BuildContext cxt,
    required List<Musics> myaudiolist,
    required int index}) {
  final size = MediaQuery.of(cxt).size;

  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Color.fromARGB(0, 223, 157, 157),
      context: cxt,
      builder: (BuildContext context) {
        Box<List> librarybox = getlibrarybox();
        return Container(
          // height: ,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            GlassContainer(
              borderRadius: BorderRadius.circular(15),
              blur: 5,
              color: const Color.fromARGB(144, 0, 0, 0).withOpacity(0.5),
              //height: size.height * 0.47,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.black,
                    padding: const EdgeInsets.all(16),
                    height: size.height * 0.20,
                    width: size.width * 0.54,
                    child: QueryArtworkWidget(
                      artworkFit: BoxFit.cover,
                      artworkBorder: BorderRadius.circular(10),
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
                    width: 170,
                    child: Center(
                      child: Text(
                        myaudiolist[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: 130,
                      child: Center(
                        child: Text(myaudiolist[index].artist,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return plalistpage(id: myaudiolist[index].id);
                      }));
                    },
                    iconColor: Colors.grey,
                    textColor: Colors.grey,
                    title: const Text(
                      'Add To Playlist',
                    ),
                    leading: const Icon(Icons.playlist_add),
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
                    title: Text('Share'),
                    leading: Icon(Icons.ios_share_outlined),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: GlassContainer(
                  borderRadius: BorderRadius.circular(14),
                  blur: 5,
                  color: Colors.black54.withOpacity(0.5),
                  height: 40,
                  width: double.infinity,
                  child: const Center(child: Text('Cancel')),
                ),
              ),
            ),
          ]),
        );
      });
}
