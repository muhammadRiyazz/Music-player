import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mixago_music/screens/widgets/playlist/addsong.dart';
import 'package:mixago_music/screens/widgets/playlist/playlistbottomsheet.dart';
import 'package:mixago_music/screens/widgets/playlist/playlistsongbottomsheet.dart';

class PlayList extends StatefulWidget {
  const PlayList({super.key});

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.black,
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
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
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text('Play List', style: TextStyle(fontSize: 19))),
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: GestureDetector(
                    onTap: () {
                      ceateplaylistalert();
                    },
                    child: GlassContainer(
                      blur: 4,
                      color: Colors.grey.shade900.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('CREATE PLAYLIST'),
                      ),
                    ),
                  ),
                ),

                Container(
                  child: Row(children: [
                    myplaylist(
                      libraryimg: 'asset/img/imgb.jpg',
                      libraryname: 'Car Music',
                      myontap: () {},
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.navigate_next_rounded,
                          color: Colors.grey,
                        ))
                  ]),
                ),

                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.amber,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   height: 200,
                //   width: 260,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(10),
                //     child: Image.asset('asset/img/imgk.jpg', fit: BoxFit.fill),
                //   ),
                // ),

                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Car Music',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text(
                              '17 Songs',
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14),
                            )
                          ]),
                    ),
                    IconButton(
                        onPressed: () {
                          addsongplaylist(context);
                        },
                        icon: Icon(
                          Icons.playlist_add,
                          color: Colors.grey,
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      songlist(
                          songimg: 'asset/img/imgd.jpg',
                          songname: 'Asik Suratm',
                          singer: 'Irmak Aricl',
                          context: context),
                      songlist(
                          songimg: 'asset/img/imgg.jpg',
                          songname: 'Shinunoga',
                          singer: 'Fujii Kaze',
                          context: context),
                      songlist(
                          songimg: 'asset/img/imga.jpg',
                          songname: 'Wonderful Life',
                          singer: 'Tavito Nanao',
                          context: context),
                      songlist(
                          songimg: 'asset/img/imgc.jpg',
                          songname: 'Trust',
                          singer: 'Liza,Yo-Sea',
                          context: context),
                      songlist(
                          songimg: 'asset/img/imge.jpg',
                          songname: 'Todai',
                          singer: 'Bialystocks',
                          context: context),
                      songlist(
                          songimg: 'asset/img/imgd.jpg',
                          songname: 'Asik Suratm',
                          singer: 'Irmak Aricl',
                          context: context),
                      songlist(
                          songimg: 'asset/img/imgg.jpg',
                          songname: 'Shinunoga',
                          singer: 'Fujii Kaze',
                          context: context),
                      songlist(
                          songimg: 'asset/img/imga.jpg',
                          songname: 'Wonderful Life',
                          singer: 'Tavito Nanao',
                          context: context),
                      songlist(
                          songimg: 'asset/img/imgc.jpg',
                          songname: 'Trust',
                          singer: 'Liza,Yo-Sea',
                          context: context),
                      songlist(
                          songimg: 'asset/img/imge.jpg',
                          songname: 'Todai',
                          singer: 'Bialystocks',
                          context: context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ])),
    );
  }

  songlist({required String songimg, songname, singer, required context}) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        height: 55,
        width: 55,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(fit: BoxFit.cover, songimg),
        ),
      ),
      title: Text(
        songname,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: Text(
        singer,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const NowPlaying()),
              // );
            },
            child: Icon(
              Icons.play_circle_outlined,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          GestureDetector(
            onTap: () {
              playlistsongbottansheet(context);
            },
            child: Icon(
              Icons.more_vert_rounded,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  myplaylist({
    required String libraryimg,
    libraryname,
    required myontap,
  }) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          //padding: EdgeInsets.all(.3),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          height: size.height * 0.22,
          width: size.width * 0.75,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: GestureDetector(
              onTap: myontap,
              // () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const Favorite()),
              //   );
              // },
              child: Image.asset(
                libraryimg,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
                height: 30,
                width: size.width * 0.75,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      libraryname,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    ),
                    GestureDetector(
                      onTap: (() {
                        playlistsbottansheet(context);
                      }),
                      child: Icon(
                        Icons.menu_open_rounded,
                        color: Colors.grey.shade600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  ceateplaylistalert() {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Create Playlist'),
            content: TextField(
              style: TextStyle(color: Colors.grey.shade600),
              decoration: InputDecoration(
                //focusColor: Colors.blue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                fillColor: Colors.white.withOpacity(0.5),
                filled: true,
                // prefixIcon: Icon(color: Colors.grey.shade700, Icons.search),
                hintText: "Your Playlist Name",
                hintStyle: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok')),
            ],
          );
        });
  }
}
