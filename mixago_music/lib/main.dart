import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/modals/profilemodal.dart';
import 'package:mixago_music/screens/playlistpage.dart';

import 'package:mixago_music/screens/splash.dart';
import 'package:mixago_music/screens/splashtwo.dart';

import 'modals/Musics.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MusicsAdapter());
  Hive.registerAdapter(UserProfileAdapter());
  await Hive.openBox<Musics>("musics");
  await Hive.openBox<List>("Library");
  await Hive.openBox<List>('playlist');
  await Hive.openBox<UserProfile>('profile');

  runApp(const Mixago());
}

class Mixago extends StatefulWidget {
  const Mixago({super.key});

  @override
  State<Mixago> createState() => _MixagoState();
}

class _MixagoState extends State<Mixago> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white.withOpacity(0.1),
        ),
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.grey.shade300),
        ),
      ),
      home: const Splash(),
    );
  }
}
