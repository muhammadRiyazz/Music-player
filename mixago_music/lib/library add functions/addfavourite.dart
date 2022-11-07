// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/Musics.dart';

import 'package:flutter/material.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../modals/database_function.dart';

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
        const CustomSnackBar.success(
            iconPositionLeft: 1,
            backgroundColor: Color.fromARGB(196, 43, 42, 42),
            messagePadding: EdgeInsets.zero,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            message: 'Added To Favourite'));

    log('added fvrt song');
    log(favouriteSongsList.length.toString());
  } else {
    favouriteSongsList.removeWhere((song) => fvrtmusic.id == song.id);
    await librarybox.put('Favourites', favouriteSongsList);

    showTopSnackBar(
        context,
        const CustomSnackBar.error(
            iconPositionLeft: 1,
            backgroundColor: Color.fromARGB(196, 43, 42, 42),
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
