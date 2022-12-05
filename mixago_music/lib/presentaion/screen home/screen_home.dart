import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/Appilcations/bloc%20file/Search/search_bloc.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/presentaion/main%20widget/songlist.dart';
import 'package:mixago_music/presentaion/screen%20home/drawer/drawer.dart';
import 'package:mixago_music/presentaion/screen%20home/widgers/Song_count.dart';
import 'package:mixago_music/presentaion/screen%20home/widgers/visible_part.dart';

class HomeScreen extends StatefulWidget {
  final List<Musics> myAudiolist;
  const HomeScreen({
    super.key,
    required this.myAudiolist,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchcontroller = TextEditingController();
  AssetsAudioPlayer mymusicplayer = AssetsAudioPlayer.withId('0');
  late List<Musics> searchmusic = List.from(widget.myAudiolist);

  var textfealdvisible = false;
  var libraryvsible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Box<List> alllibrary = getlibrarybox();
    List<Musics> recentsonglist =
        alllibrary.get('recent Played')!.toList().cast<Musics>();
    List<Musics> mostlayedsonglist =
        alllibrary.get('most Played')!.toList().cast<Musics>();
    final List<Musics> favouriteSongsList =
        alllibrary.get('Favourites')!.toList().cast<Musics>();

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: TextLiquidFill(
            text: 'MIXAGO',
            waveDuration: const Duration(minutes: 1),
            waveColor: const Color.fromARGB(255, 153, 147, 147),
            textStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 300.0,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(
                    () {
                      if (textfealdvisible == false && libraryvsible == true) {
                        textfealdvisible = true;
                        libraryvsible = false;
                      } else {
                        textfealdvisible = false;
                        libraryvsible = true;
                      }
                    },
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.grey.shade300,
                )),
          ],
          iconTheme: const IconThemeData(color: Colors.grey),
          backgroundColor: Colors.black),
      resizeToAvoidBottomInset: false,
      drawer: drawerfunction(context),
      body: Builder(builder: (context) {
        return Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.047),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 26, 12, 38),
                    Color.fromARGB(255, 0, 0, 0)
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.2, 0.8],
                  tileMode: TileMode.repeated,
                ),
              ),
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                  ),
                  TextField(
                    textfealdvisible: textfealdvisible,
                    searchcontroller: searchcontroller,
                  ),
                  VisibilityPart(
                    libraryvsible: libraryvsible,
                    size: size,
                    favouriteSongsList: favouriteSongsList,
                    mostlayedsonglist: mostlayedsonglist,
                    recentsonglist: recentsonglist,
                    alllibrary: alllibrary,
                  ),
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      return SongCount(searchmusic: state.songlist);
                    },
                  ),
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      return songlist(
                        mysonglist: state.songlist,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class TextField extends StatelessWidget {
  const TextField({
    Key? key,
    required this.textfealdvisible,
    required this.searchcontroller,
  }) : super(key: key);

  final bool textfealdvisible;
  final TextEditingController searchcontroller;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: textfealdvisible,
      child: TextFormField(
        validator: (value) {
          return;
        },
        controller: searchcontroller,
        onChanged: (value) {
          BlocProvider.of<SearchBloc>(context).add(Search(searchtext: value));
        },
        style: TextStyle(color: Colors.grey.shade600),
        decoration: InputDecoration(
          //focusColor: Colors.blue,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          fillColor: Colors.grey.shade900.withOpacity(0.5),
          filled: true,
          prefixIcon: Icon(color: Colors.grey.shade700, Icons.search),
          hintText: "search",
          hintStyle: TextStyle(
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
