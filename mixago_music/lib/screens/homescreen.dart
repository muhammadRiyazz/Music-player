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

import 'ScreenSearch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myonAudioquery = OnAudioQuery();
  //final AssetsAudioPlayer mymusicplayer = AssetsAudioPlayer();
  //var myvisible = false;

  //List<Audio> MyAudio = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                              )),
                          Image.asset('asset/img/MIXAGO.png'),
                          // const Text(
                          //   'Home',
                          //   style: TextStyle(fontSize: 20),
                          // ),
                          // IconButton(
                          //   onPressed: () {
                          //     Navigator.push(context,
                          //         MaterialPageRoute(builder: (context) {
                          //       return ScreenSearch(musiclist:);
                          //     }));
                          //     // setState(
                          //     //   () {
                          //     //     if (myvisible == true) {
                          //     //       myvisible = false;
                          //     //     } else {
                          //     //       myvisible = true;
                          //     //     }
                          //     //   },
                          //     // );
                          //   },
                          //   icon: Icon(
                          //     Icons.search,
                          //     color: Colors.grey.shade500,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Visibility(
                      // visible: myvisible,
                      child: TextField(
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
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'Library',
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
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
                                      builder: (context) => const Favorite()),
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
                                      builder: (context) => const PlayList()),
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
                                      builder: (context) => const MostPlay()),
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
                                      builder: (context) => const RecentPlay()),
                                );
                              },
                              context: context),
                          const SizedBox(
                            width: 10,
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
                            '3 Songs',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<SongModel>>(
                          future: myonAudioquery.querySongs(
                              sortType: null,
                              ignoreCase: true,
                              uriType: UriType.EXTERNAL,
                              orderType: OrderType.ASC_OR_SMALLER),
                          builder: (context, item) {
                            if (item.data == null) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (item.data!.isEmpty) {
                              return const Center(
                                child: Text('No Songs'),
                              );
                            }
                            return ListView.builder(
                                itemCount: item.data!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      myminiplayer(
                                          context: context,
                                          musiclist: item.data!,
                                          index: index);
                                    },
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: QueryArtworkWidget(
                                          artworkBorder:
                                              BorderRadius.circular(13),
                                          id: item.data![index].id,
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
                                        item.data![index].displayNameWOExt,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      subtitle: Text(
                                        '${item.data![index].artist}',
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            iconSize: 27,
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.play_circle_outlined),

                                            //
                                            color: Colors.grey.shade700,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              bottansheet(context);
                                            },
                                            child: Icon(
                                              Icons.more_vert_rounded,
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }),
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
}
