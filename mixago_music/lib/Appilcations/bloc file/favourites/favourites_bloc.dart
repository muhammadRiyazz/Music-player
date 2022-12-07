import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/modals/musics/Musics.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';
part 'favourites_bloc.freezed.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesState.initial()) {
    on<Iconchange>((event, emit) async {
      Box<List> librarybox = getlibrarybox();
      Box<Musics> songsbox = getsongsmodalbox();
      final List<Musics> allsongslist = songsbox.values.toList();
      final List<Musics> favouriteSongsList =
          librarybox.get('Favourites')!.toList().cast<Musics>();
      final fvrtmusic = allsongslist.firstWhere(
        (song) => song.id.contains(event.id),
      );
      if (favouriteSongsList.where((song) => fvrtmusic.id == song.id).isEmpty) {
        emit(FavouritesState(
            favouritelist: state.favouritelist,
            icon: const Icon(Icons.favorite_border, color: Colors.grey),
            text: 'Add To Favorites'));
      } else {
        emit(FavouritesState(
            favouritelist: state.favouritelist,
            icon: const Icon(Icons.favorite, color: Colors.red),
            text: 'Remove From Favorites'));
      }
    });
    on<Initiallist>((event, emit) async {
      Box<List> librarybox = getlibrarybox();
      final List<Musics> favouriteSongsList =
          librarybox.get('Favourites')!.toList().cast<Musics>();
      emit(FavouritesState(
          favouritelist: favouriteSongsList,
          icon: state.icon,
          text: state.text));
    });

    ///////
    on<Listchanging>((event, emit) async {
      Box<List> librarybox = getlibrarybox();
      Box<Musics> songsbox = getsongsmodalbox();
      final List<Musics> allsongslist = songsbox.values.toList();
      final List<Musics> favouriteSongsList =
          librarybox.get('Favourites')!.toList().cast<Musics>();
      final fvrtmusic = allsongslist.firstWhere(
        (song) => song.id.contains(event.id),
      );
      if (favouriteSongsList.where((song) => fvrtmusic.id == song.id).isEmpty) {
        favouriteSongsList.add(fvrtmusic);
        await librarybox.put('Favourites', favouriteSongsList);
        //BlocProvider.of<FavouritesBloc>(context).add(const Listchanging());

        Box<List> newlibrarybox = getlibrarybox();
        final List<Musics> newfavouriteSongsList =
            newlibrarybox.get('Favourites')!.toList().cast<Musics>();

        emit(FavouritesState(
            favouritelist: newfavouriteSongsList,
            icon: state.icon,
            text: state.text));
        // ignore: use_build_context_synchronously
        showTopSnackBar(
            event.context,
            CustomSnackBar.success(
              textScaleFactor: 0.8,
              iconPositionLeft: 2,
              backgroundColor: const Color.fromARGB(255, 24, 24, 33),
              messagePadding: EdgeInsets.zero,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              message: 'Added To Favourite'.toUpperCase(),
            ));
      } else {
        favouriteSongsList.removeWhere((song) => fvrtmusic.id == song.id);
        await librarybox.put('Favourites', favouriteSongsList);
        //.of<FavouritesBloc>(context).add(const Listchanging());
        Box<List> newlibrarybox = getlibrarybox();
        final List<Musics> newfavouriteSongsList =
            newlibrarybox.get('Favourites')!.toList().cast<Musics>();

        emit(FavouritesState(
            favouritelist: newfavouriteSongsList,
            icon: state.icon,
            text: state.text));

        // ignore: use_build_context_synchronously
        showTopSnackBar(
            event.context,
            CustomSnackBar.error(
                textScaleFactor: 0.8,
                iconPositionLeft: 2,
                backgroundColor: const Color.fromARGB(255, 24, 24, 33),
                messagePadding: EdgeInsets.zero,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                message: 'Removed From Favourite'.toUpperCase()));
      }
    });
  }
}
