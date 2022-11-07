import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/database_function.dart';

import '../modals/Musics.dart';

Future addmostplayed({required String id}) async {
  log('function call');
  Box<Musics> allsongs = getsongsmodalbox();
  Box<List> alllibrary = getlibrarybox();
  List<Musics> allsonglist = allsongs.values.toList();

  List<Musics> mostlayedsonglist =
      alllibrary.get('most Played')!.toList().cast<Musics>();

  log(mostlayedsonglist.length.toString());
  final selectedsong = allsonglist.firstWhere((song) => song.id.contains(id));

  if (mostlayedsonglist.length > 7) {
    mostlayedsonglist.removeLast();
  }

  if (mostlayedsonglist.where((song) => song.id == selectedsong.id).isEmpty) {
    mostlayedsonglist.insert(0, selectedsong);
    log(mostlayedsonglist.length.toString());
    await alllibrary.put('most Played', mostlayedsonglist);
  } else {
    mostlayedsonglist.removeWhere((song) => selectedsong.id == song.id);
    log(mostlayedsonglist.length.toString());
    mostlayedsonglist.insert(0, selectedsong);
    log(mostlayedsonglist.length.toString());
    await alllibrary.put('most Played', mostlayedsonglist);
  }
}
