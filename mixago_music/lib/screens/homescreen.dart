import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/library%20add%20functions/addrecent.dart';
import 'package:mixago_music/screens/favorite.dart';
import 'package:mixago_music/screens/mostplayed.dart';

import 'package:mixago_music/screens/playlistpage.dart';
import 'package:mixago_music/screens/recentlyplay.dart';
import 'package:mixago_music/screens/widgets/bottomsheet.dart';
import 'package:mixago_music/screens/widgets/homescreen/drewer.dart';
import 'package:mixago_music/screens/widgets/homescreen/librery.dart';
import 'package:mixago_music/screens/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../modals/Musics.dart';
import '../modals/database_function.dart';

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
          title: Image.asset('asset/img/MIXAGO.png'),
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
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
          ],
          iconTheme: IconThemeData(color: Colors.grey),
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
              // padding: const EdgeInsets.all(20),
              // color: Colors.black,
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {
                    //         //drawerfunction();
                    //         return Scaffold.of(context).openDrawer();
                    //       },
                    //       icon: const Icon(
                    //         Icons.menu,
                    //         color: Colors.grey,
                    //       ),
                    //     ),
                    //     Image.asset('asset/img/MIXAGO.png'),
                    //     IconButton(
                    //         onPressed: () {
                    //           setState(
                    //             () {
                    //               if (textfealdvisible == false &&
                    //                   libraryvsible == true) {
                    //                 textfealdvisible = true;
                    //                 libraryvsible = false;
                    //               } else {
                    //                 textfealdvisible = false;
                    //                 libraryvsible = true;
                    //               }
                    //             },
                    //           );
                    //         },
                    //         icon: const Icon(
                    //           Icons.search,
                    //           color: Colors.grey,
                    //         ))
                    //   ],
                    // ),
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
                          child: Text(
                            'LIBRARY',
                            style: TextStyle(
                                color: (Colors.grey.shade500),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ValueListenableBuilder(
                          builder: (BuildContext context, Box<List> value,
                              Widget? child) {
                            return SizedBox(
                              height: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  library(
                                      songcount:
                                          favouriteSongsList.length.toString(),
                                      onpress: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return Favorite();
                                          },
                                        ));
                                      },
                                      context: context,
                                      libraryname: 'FAVOURITES'),
                                  library(
                                      songcount:
                                          mostlayedsonglist.length.toString(),
                                      onpress: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return MostPlay();
                                          },
                                        ));
                                      },
                                      context: context,
                                      libraryname: 'MOST PLAYED'),
                                  library(
                                      songcount:
                                          recentsonglist.length.toString(),
                                      onpress: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return RecentPlay();
                                          },
                                        ));
                                      },
                                      context: context,
                                      libraryname: 'RECENT PLAYED'),
                                ],
                              ),
                            );
                          },
                          valueListenable: alllibrary.listenable(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return plalistpage();
                              }));
                            },
                            child: Center(
                              child: Container(
                                height: size.height * 0.07,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 26, 12, 38),
                                      Color.fromARGB(255, 47, 43, 43)
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    stops: [0.2, 0.8],
                                    tileMode: TileMode.repeated,
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  'PLAYLIST',
                                  style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
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
                          '${searchmusic.length.toString()} Songs',
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
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 200),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: ListTile(
                                      onTap: () {
                                        myminiplayer(
                                            context: context,
                                            myAudiolist: searchmusic,
                                            index: index);
                                        addrecent(id: searchmusic[index].id);
                                      },
                                      contentPadding: EdgeInsets.zero,
                                      leading: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: QueryArtworkWidget(
                                          artworkBorder:
                                              BorderRadius.circular(13),
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
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ],
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
