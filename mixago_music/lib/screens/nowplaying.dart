import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:mixago_music/library%20add%20functions/addfavourite.dart';
import 'package:mixago_music/lyrics/lyricsbottumsheet.dart';
import 'package:mixago_music/lyrics/lyricsget.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';

import 'package:mixago_music/screens/playlistpage.dart';

import 'package:on_audio_query/on_audio_query.dart';

// ignore: import_of_legacy_library_into_null_safe

class NowPlaying extends StatefulWidget {
  const NowPlaying(
      {super.key,
      required this.mymusicplayer,
      required this.mylist,
      required this.index,
      required this.allsonglist});
  final AssetsAudioPlayer mymusicplayer;
  final List<Audio> mylist;
  final int index;
  final List<Musics> allsonglist;

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  final SwiperController myswipercontroller = SwiperController();

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  var shuffle = false;
  var loop = false;

  @override
  Widget songname(AssetsAudioPlayer musicplayer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SizedBox(
        width: 160,
        child: Text(
          musicplayer.getCurrentAudioTitle,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400,
              fontSize: 19),
        ),
      ),
    );
  }

  Widget singername(AssetsAudioPlayer audioPlayer) {
    return SizedBox(
      width: 120,
      child: Text(
        audioPlayer.getCurrentAudioArtist,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Color.fromARGB(255, 241, 222, 222), fontSize: 14),
      ),
    );
  }

  Widget myprogresbar(AssetsAudioPlayer audioPlayer, Size Mysize) {
    return Padding(
      padding: EdgeInsets.only(
          top: Mysize.height * 0.02,
          bottom: Mysize.height * 0.02,
          left: Mysize.width * 0.15,
          right: Mysize.width * 0.15),
      child: audioPlayer.builderRealtimePlayingInfos(
          builder: (context, realtimePlayingInfos) {
        return ProgressBar(
          progress: realtimePlayingInfos.currentPosition,
          total: realtimePlayingInfos.duration,
          timeLabelPadding: 8,
          //progressBarColor: Colors.grey.shade100,
          timeLabelTextStyle: const TextStyle(color: Colors.grey),
          onSeek: (value) {
            widget.mymusicplayer.seek(value);
          },
        );
      }),
    );
  }

  soundduration(RealtimePlayingInfos realtimePlayingInfos) {
    // final durationpassing = realtimePlayingInfos.currentPosition;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [Text('${realtimePlayingInfos.currentPosition}')],
      ),
    );
  }

  Widget songoptions(AssetsAudioPlayer audioPlayer) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            //color: Colors.grey.shade600,
            onPressed: () {
              setState(
                () {
                  if (loop == false) {
                    loop = true;
                    widget.mymusicplayer.setLoopMode(LoopMode.single);
                  } else {
                    loop = false;
                    widget.mymusicplayer.setLoopMode(LoopMode.playlist);
                  }
                },
              );
              // widget.mymusicplayer.toggleShuffle();
            },
            icon: loop == true
                ? const Icon(
                    Icons.repeat,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.repeat,
                    color: Colors.grey,
                  ),
          ),
          Row(
            children: [
              GestureDetector(
                  onDoubleTap: () {},
                  onTap: () {
                    widget.mymusicplayer.previous();
                  },
                  child: const Icon(
                    Icons.skip_previous_rounded,
                    size: 35,
                    color: Colors.grey,
                  )),
              IconButton(
                iconSize: 53,
                color: Colors.grey,
                onPressed: () {
                  widget.mymusicplayer.playOrPause();
                  //myswipercontroller.next();
                },
                icon: PlayerBuilder.isPlaying(
                    player: audioPlayer,
                    builder: (context, isPlaying) {
                      return Icon(isPlaying
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline_rounded);
                    }),
              ),
              GestureDetector(
                  onDoubleTap: () {},
                  onTap: () {
                    widget.mymusicplayer.next();
                  },
                  child: const Icon(
                    Icons.skip_next_rounded,
                    size: 35,
                    color: Colors.grey,
                  )),
            ],
          ),
          IconButton(
            //color: Colors.grey.shade600,
            onPressed: () {
              setState(
                () {
                  if (shuffle == false) {
                    shuffle = true;
                    widget.mymusicplayer.toggleShuffle();
                  } else {
                    shuffle = false;
                    widget.mymusicplayer.toggleShuffle();
                  }
                },
              );
              // widget.mymusicplayer.toggleShuffle();
            },
            icon: shuffle == true
                ? const Icon(
                    Icons.shuffle,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.shuffle,
                    color: Colors.grey,
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Box<List> librarybox = getlibrarybox();
    Size mysize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey.shade300),
        backgroundColor: Colors.black,
        title:
            Text('NOW PLAYING', style: TextStyle(color: Colors.grey.shade300)),
      ),
      //backgroundColor: Colors.black,
      body: widget.mymusicplayer.builderCurrent(
        builder: (context, playing) {
          final mycurrentaudio =
              find(widget.mylist, playing.audio.assetAudioPath);
          return Container(
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    swiper(
                      mSize: mysize,
                      mymusic: mycurrentaudio,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: mysize.height * 0.01,
                          bottom: 0,
                          left: mysize.width * 0.15,
                          right: mysize.width * 0.15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                songname(widget.mymusicplayer),
                                singername(widget.mymusicplayer),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              ValueListenableBuilder(
                                valueListenable: librarybox.listenable(),
                                builder: (BuildContext context, Box<List> value,
                                    Widget? child) {
                                  return iconfavourite(
                                    snakctxt: context,
                                    id: mycurrentaudio.metas.id.toString(),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return plalistpage(
                                        id: mycurrentaudio.metas.id.toString());
                                  }));
                                },
                                child: const Icon(Icons.playlist_add,
                                    size: 28, color: Colors.grey),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    myprogresbar(widget.mymusicplayer, mysize),
                    songoptions(widget.mymusicplayer),
                  ],
                ),
                const Spacer(),
                lyrics(newaudioPlayer: widget.mymusicplayer, mysize: mysize),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget lyrics(
      {required AssetsAudioPlayer newaudioPlayer, required Size mysize}) {
    return Padding(
      padding: EdgeInsets.only(
          left: mysize.width * 0.10,
          // top: mysize.height * 0.02,
          right: mysize.width * 0.10),
      child: GestureDetector(
        onTap: () async {
          String lyricsstring = await getlyrics(
              myartist: newaudioPlayer.getCurrentAudioArtist,
              mytitle: newaudioPlayer.getCurrentAudioTitle);
          lyricsbottumsheet(context: context, larics: lyricsstring);
        },
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 35, 22, 46),
                  Color.fromARGB(255, 36, 29, 29)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.2, 0.8],
                tileMode: TileMode.repeated,
              ),
              // color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          height: mysize.height * 0.08,
          width: double.infinity,
          child: Center(
              child: Text(
            'LYRICS',
            style: TextStyle(
                letterSpacing: 2,
                fontSize: 14,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  Widget swiper({required Size mSize, required Audio mymusic}) {
    // int newIndex = 0;
    return SizedBox(
      height: mSize.height * 0.45,
      width: mSize.width,
      child: Swiper(
        /// index: widget.mymusicplayer,
        itemCount: widget.mylist.length,
        controller: myswipercontroller,
        itemBuilder: (context, index) {
          return QueryArtworkWidget(
            artworkBorder: BorderRadius.circular(13),
            id: int.parse(mymusic.metas.id!),
            type: ArtworkType.AUDIO,
            nullArtworkWidget: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'asset/img/music.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,

        onIndexChanged: (index) {
          widget.mymusicplayer.next();
        },
        viewportFraction: 0.75,
        scale: 0.7,
      ),
    );
  }
}
