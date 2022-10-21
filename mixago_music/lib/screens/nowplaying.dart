import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
// ignore: implementation_imports
import 'package:flutter/src/rendering/box.dart';
import 'package:mixago_music/screens/widgets/bottomsheet.dart';
import 'package:on_audio_query/on_audio_query.dart';

// ignore: import_of_legacy_library_into_null_safe

class NowPlaying extends StatefulWidget {
  const NowPlaying(
      {super.key, required this.mymusicplayer, required this.mylist});
  final AssetsAudioPlayer mymusicplayer;
  final List<Audio> mylist;
  //final int index;

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  // final AssetsAudioPlayer mymusicplayer = AssetsAudioPlayer.withId('0');
  final SwiperController myswipercontroller = SwiperController();
  //final AssetsAudioPlayer mymusicplayer = widget.mymusicplayer;
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // mymusicplayer.dispose();
    // myswipercontroller.dispose();
  }

  Widget songname(AssetsAudioPlayer musicplayer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        musicplayer.getCurrentAudioTitle,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade400,
            fontSize: 19),
      ),
    );
  }

  Widget singername(AssetsAudioPlayer audioPlayer) {
    return Text(
      audioPlayer.getCurrentAudioArtist,
      style: TextStyle(color: Color.fromARGB(255, 241, 222, 222), fontSize: 14),
    );
  }

  Widget myprogresbar(AssetsAudioPlayer audioPlayer) {
    return Padding(
      padding: EdgeInsets.only(top: 25, bottom: 10, right: 55, left: 55),
      child: audioPlayer.builderRealtimePlayingInfos(
          builder: (context, realtimePlayingInfos) {
        return ProgressBar(
          progress: realtimePlayingInfos.currentPosition,
          total: realtimePlayingInfos.duration,
          timeLabelPadding: 8,
          //progressBarColor: Colors.grey.shade100,
          timeLabelTextStyle: TextStyle(color: Colors.grey),
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
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [Text('${realtimePlayingInfos.currentPosition}')],
      ),
    );
  }

  Widget songoptions(AssetsAudioPlayer audioPlayer) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        //color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              //iconSize: 20,
              color: Colors.grey.shade600,
              onPressed: () {
                // mymusicplayer.toggleLoop();
                // mymusicplayer.loopMode;
              },
              icon: Icon(Icons.repeat_sharp),
            ),
            Row(
              children: [
                IconButton(
                    iconSize: 35,
                    color: Colors.grey,
                    onPressed: () {
                      myswipercontroller.previous();
                    },
                    icon: Icon(Icons.skip_previous_rounded)),
                IconButton(
                  iconSize: 53,
                  color: Colors.grey,
                  onPressed: () {
                    widget.mymusicplayer.playOrPause();
                  },
                  icon: PlayerBuilder.isPlaying(
                      player: audioPlayer,
                      builder: (context, isPlaying) {
                        return Icon(isPlaying
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline_rounded);
                      }),
                ),
                IconButton(
                  iconSize: 35,
                  color: Colors.grey,
                  onPressed: () {
                    myswipercontroller.next();
                  },
                  icon: Icon(Icons.skip_next_rounded),
                ),
              ],
            ),
            IconButton(
              color: Colors.grey.shade600,
              onPressed: () {},
              icon: Icon(Icons.shuffle),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size mysize = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: Colors.black,
      body: SafeArea(
        child: widget.mymusicplayer.builderCurrent(
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
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        IconButton(
                            iconSize: 18,
                            color: Colors.grey,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios_new_rounded)),
                        Text(
                          'NOW PLAYING',
                          style: TextStyle(fontSize: 16),
                        ),
                        // IconButton(
                        //     color: Colors.grey,
                        //     onPressed: () {},
                        //     icon: Icon(Icons.menu_open_rounded)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    swiper(mSize: mysize, mymusic: mycurrentaudio),
                    Container(
                      //color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 10, left: 55, right: 55),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                songname(widget.mymusicplayer),
                                singername(widget.mymusicplayer),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    bottansheet(context);
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                )
                                //Icon(Icons.playlist_add, color: Colors.grey),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    myprogresbar(widget.mymusicplayer),
                    songoptions(widget.mymusicplayer),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget swiper({required Size mSize, required Audio mymusic}) {
    return SizedBox(
      height: mSize.height * 0.45,
      width: mSize.width,
      child: Swiper(
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
        onIndexChanged: (Intex) {
          widget.mymusicplayer.playlistPlayAtIndex(Intex);
        },
        viewportFraction: 0.75,
        scale: 0.7,
      ),
    );
  }
}
