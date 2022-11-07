import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

addtoplaylist(
    {required String id,
    required String key,
    required BuildContext context}) async {
  log('function call');
  Box<List> playlisthivebox = getplaylistbox();
  Box<Musics> musicsBox = getsongsmodalbox();
  final List<Musics> currendplaylistsongs =
      playlisthivebox.get(key)!.toList().cast<Musics>();
  final List<Musics> allsongs = musicsBox.values.toList();

  final selectedsong = allsongs.firstWhere((song) => song.id.contains(id));

  if (currendplaylistsongs
      .where((song) => song.id == selectedsong.id)
      .isEmpty) {
    currendplaylistsongs.add(selectedsong);
    playlisthivebox.put(key, currendplaylistsongs);

    log('add song to playlist');
    showTopSnackBar(
        context,
        CustomSnackBar.error(
            iconPositionLeft: 1,
            backgroundColor: const Color.fromARGB(196, 43, 42, 42),
            messagePadding: EdgeInsets.zero,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            message: 'Added To $key -Playlist '));
  } else {
    log('already');
    showTopSnackBar(
        context,
        const CustomSnackBar.error(
            iconPositionLeft: 1,
            backgroundColor: Color.fromARGB(196, 43, 42, 42),
            messagePadding: EdgeInsets.zero,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            message: 'This Is Already In Your Playlist  '));
  }
}
