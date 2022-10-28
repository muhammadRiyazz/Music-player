import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mixago_music/screens/favorite.dart';
import 'package:mixago_music/screens/mostplayed.dart';
import 'package:mixago_music/screens/playlist.dart';
import 'package:mixago_music/screens/recentlyplay.dart';
import 'package:mixago_music/screens/widgets/bottomsheet.dart';
import 'package:mixago_music/screens/widgets/homescreen/drewer.dart';
import 'package:mixago_music/screens/widgets/homescreen/librery.dart';
import 'package:mixago_music/screens/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../modals/Musics.dart';
import 'nowplaying.dart';

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

  // final myonAudioquery = OnAudioQuery();
  //final AssetsAudioPlayer mymusicplayer = AssetsAudioPlayer();
  //List<Audio> mySongs = [];
  var textfealdvisible = false;
  var libraryvsible = true;
  //bool isplaying=false;
  // Audio find(List<Audio> source, String fromPath) {
  //   return source.firstWhere((element) => element.path == fromPath);
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void convertsong() {
  //   for (var song in widget.myAudiolist) {
  //     Audio myAudio = Audio.file(
  //       song.url,
  //       metas: Metas(
  //         id: song.id,
  //         title: song.title,
  //         artist: song.artist,
  //       ),
  //     );
  //     mySongs.add(myAudio);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: drawerfunction(context),
      body: Builder(builder: (context) {
        return SafeArea(
          child: Row(
            children: [
              Container(
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
                padding: const EdgeInsets.all(20),
                // color: Colors.black,
                height: size.height,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              //drawerfunction();
                              return Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.grey,
                            ),
                          ),
                          Image.asset('asset/img/MIXAGO.png'),
                          IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    if (textfealdvisible == false &&
                                        libraryvsible == true) {
                                      textfealdvisible = true;
                                      libraryvsible = false;
                                    } else {
                                      textfealdvisible = false;
                                      libraryvsible = true;
                                    }
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                    Visibility(
                      visible: textfealdvisible,
                      child: TextFormField(
                        validator: (value) {
                          return;
                        },
                        controller: searchcontroller,
                        onChanged: (value) {
                          searchsong(value);
                        },
                        style: TextStyle(color: Colors.grey.shade600),
                        decoration: InputDecoration(
                          //focusColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          fillColor: Colors.grey.shade900.withOpacity(0.5),
                          filled: true,
                          prefixIcon:
                              Icon(color: Colors.grey.shade700, Icons.search),
                          hintText: "search",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: libraryvsible,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: const Text(
                              'Library',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                library(
                                    libraryimg: 'asset/img/imgd.jpg',
                                    libraryname: 'Favorite',
                                    myontap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Favorite()),
                                      );
                                    },
                                    context: context),
                                const SizedBox(
                                  width: 10,
                                ),
                                library(
                                    libraryimg: 'asset/img/imgg.jpg',
                                    libraryname: 'Play List',
                                    myontap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PlayList()),
                                      );
                                    },
                                    context: context),
                                const SizedBox(
                                  width: 10,
                                ),
                                library(
                                    libraryimg: 'asset/img/imgw.jpg',
                                    libraryname: 'Most Played',
                                    myontap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MostPlay()),
                                      );
                                    },
                                    context: context),
                                const SizedBox(
                                  width: 10,
                                ),
                                library(
                                    libraryimg: 'asset/img/imgk.jpg',
                                    libraryname: 'Recent Played',
                                    myontap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RecentPlay()),
                                      );
                                    },
                                    context: context),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'All Songs',
                            style: TextStyle(fontSize: 17),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '  ${searchmusic.length.toString()} Songs',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: (searchmusic.isEmpty)
                          ? const Center(
                              child: Text('No Songs'),
                            )
                          : ListView.builder(
                              itemCount: searchmusic.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    // swiper(
                                    //     context: context,
                                    //     myAudiolist: widget.myAudiolist,
                                    //     index: index);
                                    myminiplayer(
                                        context: context,
                                        myAudiolist: searchmusic,
                                        index: index);
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  leading: SizedBox(
                                    height: 55,
                                    width: 55,
                                    child: QueryArtworkWidget(
                                      artworkBorder: BorderRadius.circular(13),
                                      id: int.parse(searchmusic[index].id),
                                      type: ArtworkType.AUDIO,
                                      nullArtworkWidget: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          'asset/img/music.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    searchmusic[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  subtitle: Text(
                                    searchmusic[index].artist,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          bottansheet(
                                              cxt: context,
                                              myaudiolist: searchmusic,
                                              index: index);
                                        },
                                        child: Icon(
                                          Icons.more_vert_rounded,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void searchsong(String value) {
    setState(() {
      searchmusic = widget.myAudiolist
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
