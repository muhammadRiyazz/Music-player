import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/modals/musics/Musics.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';
part 'playlist_bloc.freezed.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc() : super(PlaylistState.initial()) {
    on<Initialplaylists>((event, emit) {
      Box<List> playlistbox = getplaylistbox();
      List playlists = playlistbox.keys.toList();
      emit(PlaylistState(playlist: playlists));
    });
    on<Deleteplaylists>((event, emit) {
      Box<List> playlistbox = getplaylistbox();
      playlistbox.delete(event.key);
      Box<List> newplaylistbox = getplaylistbox();
      List keylist = playlistbox.keys.toList();

      emit(PlaylistState(playlist: keylist));
    });
    on<Renameplaylists>((event, emit) {
      String renamenewtext = event.textcntrol.text;
      Box<List> playlisthivebox = getplaylistbox();
      final List<Musics> Playlistsongs =
          playlisthivebox.get(event.key)!.toList().cast<Musics>();
      List<Musics> renameplaylistsong = Playlistsongs;
      playlisthivebox.delete(event.key);
      playlisthivebox.put(renamenewtext, renameplaylistsong);
      Box<List> newplaylisthivebox = getplaylistbox();
      List keylist = newplaylisthivebox.keys.toList();
      emit(PlaylistState(playlist: keylist));
    });
    on<Createplaylists>((event, emit) async {
      Box<List> playlisthivebox = getplaylistbox();
      final myplaylistname = event.textcntrol.text;

      await playlisthivebox.put(myplaylistname, []);
      event.textcntrol.clear();
      List keylist = playlisthivebox.keys.toList();
      emit(PlaylistState(playlist: keylist));
    });
  }
}
