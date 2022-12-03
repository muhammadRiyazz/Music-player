// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/presentaion/screen%20home/screen_home.dart';

import 'package:mixago_music/screens/homescreen.dart';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modals/database_function.dart';

bool? notificationvalue;

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
  List<SongModel> fetchedSongs = [];

  @override
  void initState() {
    super.initState();

    fetchinternalsongs();

    // changehivemodaltollist();
    putfavouritelist();
    putrecentlist();
    putmostplayedlist();
  }

  Future setboolvalue() async {
    final mySharedPreferences = await SharedPreferences.getInstance();
    notificationvalue = mySharedPreferences.getBool('notification');
    notificationvalue = notificationvalue ??= true;
  }

  Future storagepermision() async {
    await Permission.storage.request();
    log('permision');
  }

  Future fetchinternalsongs() async {
    await storagepermision();
    await setboolvalue();
    fetchedintenalsongs = await myonAudioquery.querySongs(
        ignoreCase: true,
        uriType: UriType.EXTERNAL,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: SongSortType.DISPLAY_NAME);
    log('fetch');
    await tomp3();
    await tohivebox();
    await tohomescreen();
  }

  tomp3() async {
    for (var song in fetchedintenalsongs) {
      if (song.fileExtension == 'mp3') {
        fetchedSongs.add(song);
      }
    }
  }

  tohivebox() async {
    for (var songs in fetchedSongs) {
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
    List<Musics> mysongslist = await musicsBox.values.toList();
    log('to list');
    await Future.delayed(const Duration(seconds: 6));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen(myAudiolist: mysongslist)),
    );
    log(mysongslist.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Center(
            child: SizedBox(
          // width: 250.0,
          child: TextLiquidFill(
            waveDuration: const Duration(seconds: 4),
            text: 'MIXAGO',
            waveColor: const Color.fromARGB(255, 98, 120, 158),

            ///boxBackgroundColor: Color.fromARGB(255, 0, 0, 0),
            textStyle: const TextStyle(
              fontFamily: 'Viga',
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 300.0,
          ),
        )),
      ),
    );
  }
}
