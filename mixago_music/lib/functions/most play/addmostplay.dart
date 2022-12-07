import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/Appilcations/bloc%20file/mostplay/mostplay_bloc.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/modals/musics/Musics.dart';

Future addmostplayed(
    {required String id, required BuildContext context}) async {
  Box<Musics> allsongs = getsongsmodalbox();
  Box<List> alllibrary = getlibrarybox();
  List<Musics> allsonglist = allsongs.values.toList();

  List<Musics> mostlayedsonglist =
      alllibrary.get('most Played')!.toList().cast<Musics>();

  final selectedsong = allsonglist.firstWhere((song) => song.id.contains(id));

  if (mostlayedsonglist.length > 7) {
    mostlayedsonglist.removeLast();
  }

  if (mostlayedsonglist.where((song) => song.id == selectedsong.id).isEmpty) {
    mostlayedsonglist.insert(0, selectedsong);
    await alllibrary.put('most Played', mostlayedsonglist);
    BlocProvider.of<MostplayBloc>(context).add(Mostplaysongchange());
  } else {
    mostlayedsonglist.removeWhere((song) => selectedsong.id == song.id);
    mostlayedsonglist.insert(0, selectedsong);
    await alllibrary.put('most Played', mostlayedsonglist);
    BlocProvider.of<MostplayBloc>(context).add(Mostplaysongchange());
  }
}
