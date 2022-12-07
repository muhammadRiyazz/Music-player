import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/Appilcations/bloc%20file/favourites/favourites_bloc.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/modals/musics/Musics.dart';
import 'package:mixago_music/presentaion/screen%20now%20playing/layrics_sheet/layrics.dart';
import 'package:mixago_music/presentaion/screen%20now%20playing/widgets/progresbar.dart';
import 'package:mixago_music/presentaion/screen%20now%20playing/widgets/singername.dart';
import 'package:mixago_music/presentaion/screen%20now%20playing/widgets/songname.dart';
import 'package:mixago_music/presentaion/screen%20now%20playing/widgets/swiper.dart';
import 'package:mixago_music/presentaion/screen%20playlist/playlistpage.dart';

class NowPlaying extends StatelessWidget {
  NowPlaying(
      {super.key,
      required this.mymusicplayer,
      required this.mylist,
      required this.index,
      required this.allsonglist});
  final AssetsAudioPlayer mymusicplayer;
  final List<Audio> mylist;
  final int index;
  final List<Musics> allsonglist;

  final SwiperController myswipercontroller = SwiperController();

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  soundduration(RealtimePlayingInfos realtimePlayingInfos) {
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
          PlayerBuilder.loopMode(
            player: mymusicplayer,
            builder: (context, loopMode) {
              return IconButton(
                  onPressed: () {
                    if (loopMode == LoopMode.playlist) {
                      audioPlayer.setLoopMode(LoopMode.single);
                    } else {
                      audioPlayer.setLoopMode(LoopMode.playlist);
                    }
                  },
                  icon: loopMode == LoopMode.playlist
                      ? Icon(
                          Icons.repeat,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.repeat,
                          color: Colors.grey,
                        ));
            },
          ),
          Row(
            children: [
              GestureDetector(
                  onDoubleTap: () {},
                  onTap: () {
                    mymusicplayer.previous();
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
                  mymusicplayer.playOrPause();
                },
                icon: PlayerBuilder.isPlaying(
                    player: audioPlayer,
                    builder: (context, isPlaying) {
                      log('gvd');
                      return Icon(isPlaying
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline_rounded);
                    }),
              ),
              GestureDetector(
                  onDoubleTap: () {},
                  onTap: () {
                    mymusicplayer.next();
                  },
                  child: const Icon(
                    Icons.skip_next_rounded,
                    size: 35,
                    color: Colors.grey,
                  )),
            ],
          ),
          PlayerBuilder.realtimePlayingInfos(
              player: mymusicplayer,
              builder: (context, realtimeinfo) {
                return IconButton(
                    onPressed: () {
                      mymusicplayer.toggleShuffle();
                    },
                    icon: mymusicplayer.isShuffling.value
                        ? const Icon(
                            Icons.shuffle,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.shuffle,
                            color: Colors.red,
                          ));
              })
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
      body: mymusicplayer.builderCurrent(
        builder: (context, playing) {
          final mycurrentaudio = find(mylist, playing.audio.assetAudioPath);
          BlocProvider.of<FavouritesBloc>(context).add(
            Iconchange(
              id: mycurrentaudio.metas.id.toString(),
            ),
          );
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
                      mymusicplayer: mymusicplayer,
                      mylist: mylist,
                      myswipercontroller: myswipercontroller,
                      msize: mysize,
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
                                songname(musicplayer: mymusicplayer),
                                singername(audioPlayer: mymusicplayer),
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
                              BlocBuilder<FavouritesBloc, FavouritesState>(
                                builder: (context, state) {
                                  return GestureDetector(
                                    child: state.icon,
                                    onTap: () {
                                      BlocProvider.of<FavouritesBloc>(context)
                                          .add(
                                        Listchanging(
                                            id: mycurrentaudio.metas.id
                                                .toString(),
                                            context: context),
                                      );
                                      BlocProvider.of<FavouritesBloc>(context)
                                          .add(
                                        Iconchange(
                                          id: mycurrentaudio.metas.id
                                              .toString(),
                                        ),
                                      );
                                    },
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
                    Progressbar(Mysize: mysize, audioPlayer: mymusicplayer),
                    songoptions(mymusicplayer),
                  ],
                ),
                const Spacer(),
                layrics(
                    context: context,
                    mysize: mysize,
                    newaudioPlayer: mymusicplayer)
              ],
            ),
          );
        },
      ),
    );
  }
}
