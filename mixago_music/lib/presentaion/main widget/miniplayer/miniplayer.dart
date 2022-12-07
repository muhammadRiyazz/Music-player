import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mixago_music/modals/musics/Musics.dart';
import 'package:mixago_music/presentaion/screen%20now%20playing/now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';

myminiplayer(
    {required BuildContext context,
    required List<Musics> myAudiolist,
    required int index}) {
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
    mymusicplayer.open(
      Playlist(audios: mySongs, startIndex: widget.index),
      loopMode: LoopMode.playlist,
      autoStart: true,
      showNotification: true,
    );
  }

  final myonAudioquery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return mymusicplayer.builderCurrent(
      builder: (context, playing) {
        final myaudio = find(mySongs, playing.audio.assetAudioPath);
        return SizedBox(
          height: 109,
          width: double.infinity,
          child: Swiper(
            itemCount: widget.myAudiolist.length,
            controller: myswipercontroller,
            itemBuilder: (context, index) {
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          child: GestureDetector(
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
                              color: const Color.fromARGB(246, 11, 3, 29)
                                  .withOpacity(0.4),
                              blur: 9,
                              height: 77,
                              width: double.infinity,
                              child: mymusicplayer.builderRealtimePlayingInfos(
                                builder: (context, realtimePlayingInfos) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        leading: SizedBox(
                                          width: size.width * 0.17,
                                        ),
                                        title: SizedBox(
                                          width: 90,
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
                                          width: 120,
                                          child: Text(
                                            realtimePlayingInfos.current!.audio
                                                .audio.metas.artist!,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            mymusicplayer
                                                        .getCurrentAudioTitle ==
                                                    widget.myAudiolist[0].title
                                                ? const SizedBox()
                                                : GestureDetector(
                                                    onDoubleTap: () {},
                                                    onTap: () {
                                                      mymusicplayer.previous();
                                                    },
                                                    child: Icon(
                                                      size: 32,
                                                      Icons
                                                          .skip_previous_outlined,
                                                      color:
                                                          Colors.grey.shade600,
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
                                            mymusicplayer
                                                        .getCurrentAudioTitle ==
                                                    widget
                                                        .myAudiolist[widget
                                                                .myAudiolist
                                                                .length -
                                                            1]
                                                        .title
                                                ? const SizedBox()
                                                : GestureDetector(
                                                    onDoubleTap: () {},
                                                    onTap: () {
                                                      mymusicplayer.next();
                                                    },
                                                    child: Icon(
                                                      size: 32,
                                                      Icons.skip_next_outlined,
                                                      color:
                                                          Colors.grey.shade600,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14),
                                        child: ProgressBar(
                                            timeLabelPadding: 0,
                                            thumbGlowRadius: 0,
                                            timeLabelType:
                                                TimeLabelType.totalTime,
                                            thumbColor: const Color.fromARGB(
                                                255, 1, 104, 155),
                                            thumbRadius: 0,
                                            barHeight: 1,
                                            timeLabelTextStyle: TextStyle(
                                                fontSize: 1,
                                                color: Colors.yellow
                                                    .withOpacity(0.0)),
                                            progress: realtimePlayingInfos
                                                .currentPosition,
                                            total:
                                                realtimePlayingInfos.duration),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 10,
                        left: size.width * 0.06,
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
                            height: 72,
                            width: 72,
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
