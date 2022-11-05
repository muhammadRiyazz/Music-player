import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/screens/nowplaying.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:mixago_music/screens/homescreen.dart';

import 'package:rxdart/src/streams/value_stream.dart';

myminiplayer(
    {required BuildContext context,
    required List<Musics> myAudiolist,
    required int index}) {
  log('miniplayer');
  //final myonAudioquery = OnAudioQuery();
  // Size size = MediaQuery.of(context).size;
  return showBottomSheet(
    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
    context: context,
    builder: (BuildContext context) {
      return MiniPlayer(
        myAudiolist: myAudiolist,
        index: index,
      );
    },
  );
}

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key, required this.myAudiolist, required this.index});
  final List<Musics> myAudiolist;
  final int index;

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  final SwiperController myswipercontroller = SwiperController();
  AssetsAudioPlayer mymusicplayer = AssetsAudioPlayer.withId('0');
  List<Audio> mySongs = [];

  Audio find(List<Audio> source, String fromPath) {
    log('miniplayerfind');
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  void initState() {
    super.initState();
    convertsong();
    setplay();
  }

  void convertsong() {
    log('miniplayer convert');
    for (var song in widget.myAudiolist) {
      Audio myAudio = Audio.file(
        song.url,
        metas: Metas(
          id: song.id,
          title: song.title,
          artist: song.artist,
        ),
      );

      mySongs.add(myAudio);
    }
  }

  setplay() {
    log('miniplayer set play');
    mymusicplayer.open(
      Playlist(audios: mySongs, startIndex: widget.index),
      loopMode: LoopMode.playlist,
      autoStart: true,
    );
  }

  final myonAudioquery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    log('miniplayer buld');
    Size size = MediaQuery.of(context).size;
    return mymusicplayer.builderCurrent(
      builder: (context, playing) {
        final myaudio = find(mySongs, playing.audio.assetAudioPath);
        return SizedBox(
          height: size.height * 0.15,
          width: double.infinity,
          child: Swiper(
            itemCount: widget.myAudiolist.length,
            controller: myswipercontroller,
            itemBuilder: (context, index) {
              log('swiper   12');

              return Container(
                color: Colors.grey.withOpacity(0),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(0, 217, 18, 18)),
                          height: size.height * 0.030,
                          width: double.infinity,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NowPlaying(
                                  mymusicplayer: mymusicplayer,
                                  mylist: mySongs,
                                  index: widget.index,
                                  allsonglist: widget.myAudiolist,
                                ),
                              ),
                            );
                          },
                          child: GlassContainer(
                            color: const Color.fromARGB(246, 25, 2, 2)
                                .withOpacity(0.3),
                            blur: 9,
                            height: size.height * 0.12,
                            width: double.infinity,
                            child: mymusicplayer.builderRealtimePlayingInfos(
                              builder: (context, realtimePlayingInfos) {
                                return Column(
                                  children: [
                                    ListTile(
                                      //contentPadding: EdgeInsets.zero,
                                      leading: SizedBox(
                                        width: size.width * 0.19,
                                      ),
                                      title: SizedBox(
                                        width: 50,
                                        child: Text(
                                          realtimePlayingInfos.current!.audio
                                              .audio.metas.title!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      subtitle: SizedBox(
                                        width: 100,
                                        child: Text(
                                          realtimePlayingInfos.current!.audio
                                              .audio.metas.artist!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              mymusicplayer.previous();
                                            },
                                            icon: Icon(
                                              size: 32,
                                              Icons.skip_previous_outlined,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              mymusicplayer.playOrPause();
                                            },
                                            child: Icon(
                                                size: 45,
                                                color: Colors.grey,
                                                realtimePlayingInfos.isPlaying
                                                    ? Icons
                                                        .pause_circle_outline_rounded
                                                    : Icons
                                                        .play_circle_outline_rounded),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              mymusicplayer.next();
                                            },
                                            icon: Icon(
                                              size: 32,
                                              Icons.skip_next_outlined,
                                              color: Colors.grey.shade600,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    ProgressBar(
                                        thumbGlowRadius: 0,
                                        timeLabelType: TimeLabelType.totalTime,
                                        //thumbCanPaintOutsideBar: true,
                                        thumbColor: Colors.blueGrey,
                                        thumbRadius: 1,
                                        barHeight: 2,
                                        timeLabelTextStyle: TextStyle(
                                            fontSize: 1,
                                            color:
                                                Colors.yellow.withOpacity(0)),
                                        progress: realtimePlayingInfos
                                            .currentPosition,
                                        total: realtimePlayingInfos.duration),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        right: size.width * 0.75,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NowPlaying(
                                  mymusicplayer: mymusicplayer,
                                  mylist: mySongs,
                                  index: index,
                                  allsonglist: widget.myAudiolist,
                                ),
                              ),
                            );
                          },
                          child: GlassContainer(
                            blur: 5,
                            color: Colors.black.withOpacity(0.1),
                            height: 75,
                            width: 75,
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: QueryArtworkWidget(
                                artworkBorder: BorderRadius.circular(10),
                                id: int.parse(myaudio.metas.id!),
                                type: ArtworkType.AUDIO,
                                nullArtworkWidget: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    'asset/img/music.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              );
            },
            // ignore: non_constant_identifier_names
            onIndexChanged: (Intex) {
              mymusicplayer.next();
            },
            viewportFraction: 1,
            scale: 0.9,
          ),
        );
      },
    );
  }
}
