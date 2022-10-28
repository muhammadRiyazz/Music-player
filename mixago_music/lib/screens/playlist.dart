import 'dart:developer';

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/screens/widgets/playlist/addsong.dart';
import 'package:mixago_music/screens/widgets/playlist/playlistbottomsheet.dart';
import 'package:mixago_music/screens/widgets/playlist/playlistsongbottomsheet.dart';

class PlayList extends StatefulWidget {
  const PlayList({super.key});

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  final createplaylistcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    toplaylisthivebox();
  }

  toplaylisthivebox() async {
    Box<List> playlistbox = getplaylistbox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Playlist',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.black,
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Container(
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
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        ceateplaylistalert();
                      },
                      child: GlassContainer(
                        blur: 4,
                        color: Colors.grey.shade900.withOpacity(0.3),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('CREATE PLAYLIST'),
                        ),
                      ),
                    ),
                  ),
                ),
                playlistswiper(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Car Music',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Text(
                            '17 Songs',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 14),
                          )
                        ]),
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
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Color.fromARGB(0, 255, 193, 7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 330,
                child: Column(
                  children: [
                    Expanded(
                      child: GlassContainer(
                        borderRadius: BorderRadius.circular(25),
                        blur: 2,
                        color: Color.fromARGB(148, 11, 0, 0).withOpacity(0.6),
                        child: Column(
                          children: [
                            const Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Create Your Playlist',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                            Container(
                              height: 150,
                              width: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'asset/img/music.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: createplaylistcontroller,
                                style: TextStyle(color: Colors.grey.shade400),
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700),
                                  hintText: "Enter Playlist Name",
                                  labelStyle:
                                      TextStyle(color: Color(0xFF424242)),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const GlassContainer(
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text('Cancel'),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                createplaylist();
                                Navigator.pop(context);
                              },
                              child: const GlassContainer(
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text('Create'),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }

  createplaylist() async {
    final myplaylistname = createplaylistcontroller.text;
    Box<List> playlistbox = getplaylistbox();

    log(myplaylistname.toString());
    await playlistbox.put(myplaylistname, []);
    log(playlistbox.length.toString());
  }

  playlistswiper() {
    final SwiperController myswipercontroller = SwiperController();
    Box<List> playlistbox = getplaylistbox();
    log(playlistbox.length.toString());
    return Container(
      height: 150,
      child: Swiper(
        controller: myswipercontroller,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    child: Text(''),
                    color: Colors.black.withOpacity(0.8),
                    height: 45,
                  ))
            ],
          );
        },
        itemCount: playlistbox.length,
        scrollDirection: Axis.horizontal,
        onIndexChanged: (index) {},
        viewportFraction: 0.75,
        scale: 0.7,
      ),
    );
  }
}
