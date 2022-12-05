import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

part 'playlistsong_event.dart';
part 'playlistsong_state.dart';
part 'playlistsong_bloc.freezed.dart';

class PlaylistsongBloc extends Bloc<PlaylistsongEvent, PlaylistsongState> {
  PlaylistsongBloc() : super(PlaylistsongState.initial()) {
    on<Songadd>((event, emit) async {
      Box<List> playlisthivebox = getplaylistbox();
      Box<Musics> musicsBox = getsongsmodalbox();
      final List<Musics> currendplaylistsongs =
          playlisthivebox.get(event.listkey)!.toList().cast<Musics>();
      final List<Musics> allsongs = musicsBox.values.toList();

      final selectedsong =
          allsongs.firstWhere((song) => song.id.contains(event.id));

      if (currendplaylistsongs
          .where((song) => song.id == selectedsong.id)
          .isEmpty) {
        currendplaylistsongs.add(selectedsong);
        playlisthivebox.put(event.listkey, currendplaylistsongs);
        Box<List> newplaylistbox = getplaylistbox();
        List<Musics> newsongslist =
            newplaylistbox.get(event.listkey)!.toList().cast<Musics>();
        emit(PlaylistsongState(musiclist: newsongslist));

        showTopSnackBar(
            event.context,
            CustomSnackBar.success(
                iconPositionLeft: 1,
                textScaleFactor: 0.8,
                backgroundColor: const Color.fromARGB(255, 24, 24, 33),
                messagePadding: EdgeInsets.zero,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                message: 'Added To playlist'.toUpperCase()));
      } else {
        Box<List> newplaylistbox = getplaylistbox();

        List<Musics> newsongslist =
            newplaylistbox.get(event.listkey)!.toList().cast<Musics>();
        emit(PlaylistsongState(musiclist: newsongslist));
        showTopSnackBar(
            event.context,
            CustomSnackBar.info(
                iconPositionLeft: 1,
                textScaleFactor: 0.8,
                backgroundColor: const Color.fromARGB(255, 24, 24, 33),
                messagePadding: EdgeInsets.zero,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                message: 'This Is Already In Your Playlist'.toUpperCase()));
      }
    });

    ///////
    on<blocsongremove>((event, emit) async {
      Box<Musics> allsongbox = getsongsmodalbox();
      Box<List> playlistbox = getplaylistbox();
      List<Musics> allsongslist = allsongbox.values.toList();
      final List<Musics> Playlistsongs =
          playlistbox.get(event.listkey)!.toList().cast<Musics>();

      Playlistsongs.removeWhere((element) => element.id == event.id);
      await playlistbox.put(event.listkey, Playlistsongs);
      Box<List> newplaylistbox = getplaylistbox();
      List<Musics> newsongslist =
          newplaylistbox.get(event.listkey)!.toList().cast();
      emit(PlaylistsongState(musiclist: newsongslist));
      // ignore: use_build_context_synchronously
      showTopSnackBar(
          event.context,
          CustomSnackBar.info(
              iconPositionLeft: 1,
              textScaleFactor: 0.8,
              backgroundColor: const Color.fromARGB(255, 24, 24, 33),
              messagePadding: EdgeInsets.zero,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              message: 'removed in playlist'.toUpperCase()));
    });

    ////////
    on<Initialsonglist>((event, emit) async {
      Box<List> newplaylistbox = getplaylistbox();
      List<Musics> newsongslist =
          newplaylistbox.get(event.listkey)!.toList().cast();

      emit(PlaylistsongState(musiclist: newsongslist));
    });
  }
}
