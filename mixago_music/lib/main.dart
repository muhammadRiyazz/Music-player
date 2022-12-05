import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/Appilcations/bloc%20file/Search/search_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/favourites/favourites_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/loop%20and%20shuffle/loop_and_shuffle_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlist/playlist_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlistsong/playlistsong_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/recent/recent_bloc.dart';
import 'package:mixago_music/modals/profilemodal.dart';
import 'package:mixago_music/presentaion/screen%20splash/splash.dart';
import 'Appilcations/bloc file/mostplay/mostplay_bloc.dart';
import 'modals/Musics.dart';

void main() async {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
          create: (context) => RecentBloc(),
        ),
        BlocProvider(
          create: (context) => FavouritesBloc(),
        ),
        BlocProvider(
          create: (context) => MostplayBloc(),
        ),
        BlocProvider(
          create: (context) => PlaylistBloc(),
        ),
        BlocProvider(
          create: (context) => PlaylistsongBloc(),
        ),
        BlocProvider(
          create: (context) => LoopAndShuffleBloc(),
        ),
      ],
      child: MaterialApp(
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
        home: Splash(),
      ),
    );
  }
}
