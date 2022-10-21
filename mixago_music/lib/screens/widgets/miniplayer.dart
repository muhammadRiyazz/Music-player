import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mixago_music/screens/nowplaying.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:mixago_music/screens/homescreen.dart';
import 'package:rxdart/src/streams/value_stream.dart';

myminiplayer(
    {required BuildContext context,
    required List<SongModel> musiclist,
    required int index}) {
  //final myonAudioquery = OnAudioQuery();
  // Size size = MediaQuery.of(context).size;
  return showBottomSheet(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      context: context,
      builder: (BuildContext context) {
        return MiniPlayer(
          mylist: musiclist,
          index: index,
        );
      });
}

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key, required this.mylist, required this.index});
  final List<SongModel> mylist;
  final int index;

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  void initState() {
    super.initState();
    convertsong();
    setPlaylist();
  }

  AssetsAudioPlayer mymusicplayer = AssetsAudioPlayer.withId('0');
  setPlaylist() async {
    await mymusicplayer.open(
      Playlist(
        audios: mymusic,
        startIndex: widget.index,
      ),
      autoStart: true,
      loopMode: LoopMode.playlist,
    );
  }

  List<Audio> mymusic = [];

  void convertsong() {
    for (var song in widget.mylist) {
      Audio myAudio = Audio.file(
        song.uri!,
        metas: Metas(
          id: song.id.toString(),
          artist: song.artist,
          title: song.title,
        ),
      );
      mymusic.add(myAudio);
    }
  }

  final myonAudioquery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return mymusicplayer.builderCurrent(builder: (context, playing) {
      final myaudio = find(mymusic, playing.audio.assetAudioPath);
      return SizedBox(
        height: 110,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(0, 0, 0, 0),
                  ),
                  height: 30,
                  width: double.infinity,
                ),
                GlassContainer(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(8)),
                  color: Color.fromARGB(255, 10, 0, 0).withOpacity(0.5),
                  blur: 3,
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          //color: Colors.amber,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      mymusicplayer.builderRealtimePlayingInfos(
                                        builder:
                                            (context, realtimePlayingInfos) {
                                          return Text(
                                            realtimePlayingInfos.current!.audio
                                                .audio.metas.title!,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                            ),
                                          );
                                        },
                                      ),
                                      mymusicplayer.builderRealtimePlayingInfos(
                                        builder:
                                            (context, realtimePlayingInfos) {
                                          return Text(
                                            realtimePlayingInfos.current!.audio
                                                .audio.metas.artist!,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          );
                                        },
                                      )

                                      //                                ProgressBar(
                                      //   progress: mymusicplayer.realtimePlayingInfos.currentPosition,
                                      //   total:  mymusicplayer.realtimePlayingInfos.duration,
                                      //   timeLabelPadding: 8,
                                      //   progressBarColor: Colors.grey.shade100,
                                      //   timeLabelTextStyle: TextStyle(color: Colors.grey),
                                      //   onSeek: (value) {
                                      //     //widget.mymusicplayer.seek(value);
                                      //   },
                                      // ),

                                      // myprogresbar( realtimePlayingInfos) ,
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            color: Colors.white,
                            onPressed: () {
                              mymusicplayer.previous();
                            },
                            icon: const Icon(Icons.skip_previous_rounded),
                          ),
                          mymusicplayer.builderRealtimePlayingInfos(
                            builder: (context, realtimePlayingInfos) {
                              return IconButton(
                                iconSize: 45,
                                color: Colors.grey,
                                onPressed: () {
                                  mymusicplayer.playOrPause();
                                },
                                icon: Icon(realtimePlayingInfos.isPlaying
                                    ? Icons.pause_circle_outline
                                    : Icons.play_circle_outline_rounded),
                              );
                            },
                          ),
                          IconButton(
                            color: Colors.white,
                            onPressed: () {
                              mymusicplayer.next();
                            },
                            icon: const Icon(Icons.skip_next_rounded),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                right: size.width * 0.76,
                top: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NowPlaying(
                                mymusicplayer: mymusicplayer,
                                mylist: mymusic,
                              )),
                    );
                  },
                  child: GlassContainer(
                    blur: 5,
                    color: Colors.blue.shade600.withOpacity(0.1),
                    height: 75,
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: QueryArtworkWidget(
                        artworkBorder: BorderRadius.circular(13),
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
    });
  }

  Widget myprogresbar(RealtimePlayingInfos realtimePlayingInfos) {
    return Padding(
      padding: EdgeInsets.only(top: 25, bottom: 10, right: 55, left: 55),
      child: ProgressBar(
        progress: realtimePlayingInfos.currentPosition,
        total: realtimePlayingInfos.duration,
        timeLabelPadding: 8,
        //progressBarColor: Colors.grey.shade100,
        timeLabelTextStyle: TextStyle(color: Colors.grey),
        onSeek: (value) {
          //widget.mymusicplayer.seek(value);
        },
      ),
    );
  }

  // Widget myprogresbar(RealtimePlayingInfos realtimePlayingInfos) {
  //   return Padding(
  //     padding: EdgeInsets.only(top: 25, bottom: 10, right: 55, left: 55),
  //     child: ProgressBar(
  //       progress: realtimePlayingInfos.currentPosition,
  //       total: realtimePlayingInfos.duration,
  //       timeLabelPadding: 8,
  //       //progressBarColor: Colors.grey.shade100,
  //       timeLabelTextStyle: TextStyle(color: Colors.grey),
  //       onSeek: (value) {
  //         widget.mymusicplayer.seek(value);
  //       },
  //     ),
  //   );
  // }
}

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const NowPlaying(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }
