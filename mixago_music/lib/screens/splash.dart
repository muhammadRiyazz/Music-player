// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/Musics.dart';

import 'package:mixago_music/screens/homescreen.dart';
import 'package:mixago_music/screens/splashtwo.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

import '../modals/database_function.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final myonAudioquery = OnAudioQuery();
  List<SongModel> fetchedintenalsongs = [];
  Box<Musics> musicsBox = getsongsmodalbox();
  Box<List> librarybox = getlibrarybox();

  @override
  void initState() {
    super.initState();

    fetchinternalsongs();

    // changehivemodaltollist();
    putfavouritelist();
    putrecentlist();
    putmostplayedlist();
    tohomescreen();
  }

  Future storagepermision() async {
    await Permission.storage.request();
    log('permision');
  }

  Future fetchinternalsongs() async {
    storagepermision();
    fetchedintenalsongs = await myonAudioquery.querySongs(
        ignoreCase: true,
        uriType: UriType.EXTERNAL,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: SongSortType.DISPLAY_NAME);
    log('fetch');
    tohivebox();
  }

  tohivebox() async {
    for (var songs in fetchedintenalsongs) {
      final mysong = Musics(
        id: songs.id.toString(),
        artist: songs.artist!,
        title: songs.title,
        url: songs.uri!,
      );
      await musicsBox.put(mysong.id, mysong);
    }
    log('convert');
  }

  Future putfavouritelist() async {
    if (!librarybox.keys.contains('Favourites')) {
      await librarybox.put('Favourites', []);
      log('create fvrt list mt');
    }
  }

  Future putrecentlist() async {
    if (!librarybox.keys.contains('recent Played')) {
      await librarybox.put('recent Played', []);
      log('create recent list mt');
    }
  }

  Future putmostplayedlist() async {
    if (!librarybox.keys.contains('most Played')) {
      await librarybox.put('most Played', []);
      log('create most list mt');
    }
  }

  tohomescreen() async {
    List<Musics> mysongslist = musicsBox.values.toList();
    log('to list');
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => splashtwo(myAudiolist: mysongslist)),
    );
    log(mysongslist.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color(0xFF030312),
          child: Center(
              child: Stack(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                curve: Curves.elasticOut,
                duration: const Duration(seconds: 4),
                opacity: 1,
                child: Image.asset('asset/img/logo_samp.png'),
              ),
              Positioned(
                top: 120,
                left: 38,
                child: AnimatedOpacity(
                    curve: Curves.elasticOut,
                    duration: const Duration(seconds: 9),
                    opacity: 1,
                    child: Image.asset('asset/img/MIXAGO.png')),
              ),
            ],
          ))),
    );
  }
}
