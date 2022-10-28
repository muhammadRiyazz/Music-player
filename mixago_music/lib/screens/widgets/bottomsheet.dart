// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/Musics.dart';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:on_audio_query/on_audio_query.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 15),
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
                    // color: Colors.black,
                    padding: EdgeInsets.all(16),
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
                  const ListTile(
                    iconColor: Colors.grey,
                    textColor: Colors.grey,
                    title: Text(
                      'Add To Playlist',
                      //style: TextStyle(color: Colors.grey),
                    ),
                    leading: Icon(Icons.playlist_add),
                  ),
                  ValueListenableBuilder(
                    valueListenable: librarybox.listenable(),
                    builder:
                        (BuildContext context, Box<List> value, Widget? child) {
                      return textfvrtaddremove(
                          id: myaudiolist[index].id, snakctxt: context);
                    },
                  ),
                  const ListTile(
                    iconColor: Colors.grey,
                    textColor: Colors.grey,
                    title: Text('Share'),
                    leading: Icon(Icons.ios_share_outlined),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: GlassContainer(
                borderRadius: BorderRadius.circular(14),
                blur: 5,
                color: Colors.black54.withOpacity(0.5),
                height: 40,
                width: double.infinity,
                child: Center(child: Text('Cancel')),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        );
      });
}

Future tofavoritehivebox(
    {required String id, required BuildContext context}) async {
  Box<List> librarybox = getlibrarybox();
  log('${librarybox.length.toString()}  -library box');

  Box<Musics> songsbox = getsongsmodalbox();
  log('${songsbox.length.toString()}  -songs box');

  final List<Musics> allsongslist = songsbox.values.toList();
  log('hayyysong');
  final List<Musics> favouriteSongsList =
      librarybox.get('Favourites')!.toList().cast<Musics>();
  log('hayyysong gg');
  final fvrtmusic = allsongslist.firstWhere(
    (song) => song.id.contains(id),
  );
  log('hayyysong   tt');

  if (favouriteSongsList.where((song) => fvrtmusic.id == song.id).isEmpty) {
    favouriteSongsList.add(fvrtmusic);
    await librarybox.put('Favourites', favouriteSongsList);

    showTopSnackBar(
      context,
      GlassContainer(
        width: 50,
        blur: 1,
        color: Colors.black.withOpacity(0.3),
        child: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Center(
            child: Text(
              'ADDED TO FAVOURITES',
              style: TextStyle(
                  color: Color.fromARGB(119, 255, 255, 255), fontSize: 11),
            ),
          ),
        ),
      ),
    );

    log('added fvrt song');
    log(favouriteSongsList.length.toString());
  } else {
    favouriteSongsList.removeWhere((song) => fvrtmusic.id == song.id);
    await librarybox.put('Favourites', favouriteSongsList);

    showTopSnackBar(
        context,
        CustomSnackBar.error(
            iconPositionLeft: 1,
            backgroundColor: Colors.red.shade800,
            messagePadding: EdgeInsets.zero,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            message: 'Removed From Favourite'));
    log('rmve fvrt song');
    log(favouriteSongsList.length.toString());
  }
}

Widget textfvrtaddremove({required String id, required BuildContext snakctxt}) {
  Box<List> librarybox = getlibrarybox();

  Box<Musics> songsbox = getsongsmodalbox();

  final List<Musics> allsongslist = songsbox.values.toList();

  final List<Musics> favouriteSongsList =
      librarybox.get('Favourites')!.toList().cast<Musics>();

  final fvrtmusic = allsongslist.firstWhere(
    (song) => song.id.contains(id),
  );

  if (favouriteSongsList.where((song) => fvrtmusic.id == song.id).isEmpty) {
    //snackbarpopup(context: snakctxt);

    return ListTile(
      onTap: () {
        tofavoritehivebox(id: id, context: snakctxt);
      },
      iconColor: Colors.grey,
      textColor: Colors.grey,
      title: const Text('Add To Favorites'),
      leading: const Icon(Icons.favorite_border),
    );
  } else {
    favouriteSongsList.removeWhere((song) => fvrtmusic.id == song.id);
    return ListTile(
      onTap: () {
        tofavoritehivebox(id: id, context: snakctxt);
      },
      iconColor: Colors.red,
      textColor: Colors.grey,
      title: const Text('Remove From Favorites'),
      leading: const Icon(Icons.favorite),
    );
  }
}
