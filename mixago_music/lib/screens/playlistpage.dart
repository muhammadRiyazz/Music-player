import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/playlistfunctions/addplaylistsongs.dart';
import 'package:mixago_music/playlistfunctions/addsong%20in%20bottunsheet.dart';
import 'package:mixago_music/playlistfunctions/createplaylist.dart';
import 'package:mixago_music/playlistfunctions/playlistbottumsheet.dart';

import 'package:mixago_music/screens/widgets/miniplayer.dart';

import 'package:on_audio_query/on_audio_query.dart';

import '../library add functions/addrecent.dart';
import '../modals/Musics.dart';

import '../playlistfunctions/rename _and_delete.dart';

class plalistpage extends StatefulWidget {
  const plalistpage({
    super.key,
    this.id,
  });
  final String? id;

  @override
  State<plalistpage> createState() => _plalistpageState();
}

class _plalistpageState extends State<plalistpage> {
  PageController mycontroller = PageController();
  final createplaylistcontroller = TextEditingController();

  late Box<List> playlisthivebox;

  late Box<Musics> allsongshivebox;

  @override
  void initState() {
    super.initState();
    toplaylistbox();
  }

  toplaylistbox() {
    playlisthivebox = getplaylistbox();
    allsongshivebox = getsongsmodalbox();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List playlistkeys = playlisthivebox.keys.toList();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey.shade300),
        backgroundColor: Colors.black,
        title: Text(
          'Playlist'.toUpperCase(),
          style: TextStyle(color: Colors.grey.shade300),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: playlisthivebox.listenable(),
        builder: (BuildContext context, Box<List> value, Widget? child) {
          // Box<List> playlisthivebox = getplaylistbox();
          List playlistkeys = value.keys.toList();
          //  final List<Musics> Playlistsongs =
          //     playlisthivebox.get(playlistkeys[Index])!.toList().cast<Musics>();
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    ceateplaylistalert(
                        context: context,
                        createplaylistcontroller: createplaylistcontroller);
                  },
                  child: Center(
                    child: Container(
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
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
                        'CREATE PLAYLIST',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),

                // Text('Plalist'),
                SizedBox(
                  height: size.height * 0.14,
                  //  color: Colors.blue,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: size.width * 0.025,
                      );
                    },
                    itemCount: playlistkeys.length,
                    itemBuilder: (context, index) {
                      final List<Musics> Playlistsongs = value
                          .get(playlistkeys[index])!
                          .toList()
                          .cast<Musics>();
                      return GestureDetector(
                        onTap: () {
                          if (widget.id != null) {
                            addtoplaylist(
                                context: context,
                                id: widget.id.toString(),
                                key: playlistkeys[index]);

                            Navigator.pop(context);
                          }

                          mycontroller.jumpToPage(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 26, 12, 38),
                                  Color.fromARGB(69, 59, 56, 56)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [0.2, 0.8],
                                tileMode: TileMode.repeated,
                              ),
                              //  color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                          width: size.width * 0.50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 10, bottom: 3),
                                      child: SizedBox(
                                        width: 105,
                                        child: Text(
                                          playlistkeys[index]
                                              .toString()
                                              .toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.04,
                                              color: Colors.grey.shade500),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        '${Playlistsongs.length} Songs',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade700),
                                      ),
                                    )
                                  ]),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 7),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        playlistsbottansheet(
                                            context: context,
                                            key: playlistkeys[index]);
                                      },
                                      child: const Icon(
                                        Icons.menu,
                                        size: 27,
                                        color:
                                            Color.fromARGB(159, 167, 154, 154),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                PageViewsongs()
              ],
            ),
          );
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  PageViewsongs() {
    Size size = MediaQuery.of(context).size;
    List playlistkeys = playlisthivebox.keys.toList();

    return playlistkeys.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: size.width * 0.5,
              ),
              const Center(
                child: Text('No Playlist'),
              ),
            ],
          )
        : Expanded(
            child: PageView.builder(
              controller: mycontroller,
              itemCount: playlistkeys.length,
              itemBuilder: (context, keyindex) {
                List playlistkeys = playlisthivebox.keys.toList();
                final List<Musics> Playlistsongs = playlisthivebox
                    .get(playlistkeys[keyindex])!
                    .toList()
                    .cast<Musics>();
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: Text(
                        playlistkeys[keyindex].toString().toUpperCase(),
                        style: TextStyle(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            '${Playlistsongs.length.toString()} SONGS',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.034,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            addsongplaylist(
                              ctxt: context,
                              keys: playlistkeys[keyindex],
                            );
                          },
                          icon: const Icon(
                            Icons.playlist_add,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: (Playlistsongs.isEmpty)
                          ? const Center(
                              child: Text('No Songs'),
                            )
                          : ListView.builder(
                              itemCount: Playlistsongs.length,
                              itemBuilder: (context, Index) {
                                return ListTile(
                                  onTap: () {
                                    myminiplayer(
                                        context: context,
                                        myAudiolist: Playlistsongs,
                                        index: Index);
                                    addrecent(
                                        id: Playlistsongs[Index].id,
                                        context: context);
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  leading: SizedBox(
                                    height: size.height * 0.07,
                                    width: size.width * 0.15,
                                    child: QueryArtworkWidget(
                                      artworkBorder: BorderRadius.circular(13),
                                      id: int.parse(Playlistsongs[Index].id),
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
                                    Playlistsongs[Index].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  subtitle: Text(
                                    Playlistsongs[Index].artist,
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
                                          bottansheetinplaylistlisttile(
                                              cxt: context,
                                              myaudiolist: Playlistsongs,
                                              index: Index,
                                              key: playlistkeys[keyindex]);
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
                );
              },
            ),
          );
  }
}
