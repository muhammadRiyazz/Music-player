import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/Appilcations/bloc%20file/recent/recent_bloc.dart';
import 'package:mixago_music/functions/most%20play/addmostplay.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/modals/musics/Musics.dart';

addrecent({required String id, required BuildContext context}) async {
  log('function call');
  Box<Musics> allsongs = getsongsmodalbox();

  List<Musics> allsonglist = allsongs.values.toList();
  Box<List> alllibrary = getlibrarybox();
  List<Musics> recentsonglist =
      alllibrary.get('recent Played')!.toList().cast<Musics>();

  final selectedsong = allsonglist.firstWhere((song) => song.id.contains(id));
  int? mostcount = selectedsong.count;
  selectedsong.count = (mostcount! + 1);

  if (selectedsong.count! > 5) {
    addmostplayed(id: id, context: context);
  }

  if (recentsonglist.length > 7) {
    recentsonglist.removeLast();
  }

  if (recentsonglist.where((song) => song.id == selectedsong.id).isEmpty) {
    recentsonglist.insert(0, selectedsong);
    await alllibrary.put('recent Played', recentsonglist);
    BlocProvider.of<RecentBloc>(context).add(const Recentlistchanging());
  } else {
    recentsonglist.removeWhere((song) => selectedsong.id == song.id);
    recentsonglist.insert(0, selectedsong);
    await alllibrary.put('recent Played', recentsonglist);
    BlocProvider.of<RecentBloc>(context).add(const Recentlistchanging());
  }
}