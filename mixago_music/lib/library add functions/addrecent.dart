import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/library%20add%20functions/addmostplay.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';

addrecent({required String id}) async {
  log('function call');
  Box<Musics> allsongs = getsongsmodalbox();

  List<Musics> allsonglist = allsongs.values.toList();
  Box<List> alllibrary = getlibrarybox();
  List<Musics> recentsonglist =
      await alllibrary.get('recent Played')!.toList().cast<Musics>();

  log(recentsonglist.length.toString());
  final selectedsong = allsonglist.firstWhere((song) => song.id.contains(id));
  int? mostcount = selectedsong.count;
  selectedsong.count = (mostcount! + 1);

  if (selectedsong.count! > 5) {
    addmostplayed(id: id);
  }

  if (recentsonglist.length > 7) {
    recentsonglist.removeLast();
  }

  if (recentsonglist.where((song) => song.id == selectedsong.id).isEmpty) {
    recentsonglist.insert(0, selectedsong);
    log(recentsonglist.length.toString());
    await alllibrary.put('recent Played', recentsonglist);
  } else {
    recentsonglist.removeWhere((song) => selectedsong.id == song.id);
    log(recentsonglist.length.toString());
    recentsonglist.insert(0, selectedsong);
    log(recentsonglist.length.toString());
    await alllibrary.put('recent Played', recentsonglist);
  }
}
