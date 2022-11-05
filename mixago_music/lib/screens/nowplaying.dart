import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
// ignore: implementation_imports
import 'package:flutter/src/rendering/box.dart';
import 'package:mixago_music/modals/Musics.dart';

import 'package:mixago_music/screens/playlistpage.dart';
import 'package:mixago_music/screens/widgets/bottomsheet.dart';
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
  //final int index;

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  //final AssetsAudioPlayer mymusicplayer = AssetsAudioPlayer.withId('0');
  final SwiperController myswipercontroller = SwiperController();
  //final AssetsAudioPlayer mymusicplayer = widget.mymusicplayer;
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  var shuffle = false;
  var loop = false;

  @override
  void initState() {
    super.initState();
  }

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
                  ? Icon(
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
                IconButton(
                    iconSize: 35,
                    color: Colors.grey,
                    onPressed: () {
                      widget.mymusicplayer.previous();
                    },
                    icon: const Icon(Icons.skip_previous_rounded)),
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
                IconButton(
                  iconSize: 35,
                  color: Colors.grey,
                  onPressed: () {
                    widget.mymusicplayer.next();
                  },
                  icon: Icon(Icons.skip_next_rounded),
                ),
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
                  ? Icon(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size mysize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.black,
        title: Text('NOW PLAYING', style: TextStyle(color: Colors.grey)),
      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mysize.height * 0.03,
                    ),
                    swiper(
                      mSize: mysize,
                      mymusic: mycurrentaudio,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 7, bottom: 0, left: 55, right: 55),
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
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    tofavoritehivebox(
                                        context: context,
                                        id: mycurrentaudio.metas.id.toString());
                                  },
                                  child: const Icon(Icons.favorite,
                                      color: Colors.grey)),
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
