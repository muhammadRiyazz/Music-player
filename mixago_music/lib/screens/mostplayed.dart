import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/screens/widgets/bottomsheet.dart';
import 'package:mixago_music/screens/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../library add functions/addrecent.dart';

class MostPlay extends StatefulWidget {
  const MostPlay({super.key});

  @override
  State<MostPlay> createState() => _MostPlayState();
}

class _MostPlayState extends State<MostPlay> {
  @override
  Widget build(BuildContext context) {
    final AssetsAudioPlayer mymusicplayer = AssetsAudioPlayer();
    Box<List> librarybox = getlibrarybox();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Most Played',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Container(
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
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        //color: Colors.black,
        child: ValueListenableBuilder(
          valueListenable: librarybox.listenable(),
          builder: (BuildContext context, Box<List> value, Widget? child) {
            List<Musics> mostlayedsonglist =
                librarybox.get('most Played')!.toList().cast<Musics>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 22,
                // ),

                // Container(
                //   padding: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //       //color: Colors.white12.withOpacity(0.1),
                //       borderRadius: BorderRadius.circular(7)),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Container(
                //         padding: EdgeInsets.only(right: 15),
                //         height: size.width * 0.45,
                //         width: size.width * 0.45,
                //         child: ClipRRect(
                //             borderRadius: BorderRadius.circular(10),
                //             child: Image.asset(
                //               'asset/img/imge.jpg',
                //               fit: BoxFit.cover,
                //             )),
                //       ),
                //       Container(
                //         //  color: Colors.blue,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             // SizedBox(
                //             //   height: 5,
                //             // ),
                //             Text(
                //               'Song Name',
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold, fontSize: 19),
                //             ),
                //             SizedBox(
                //               height: 5,
                //             ),
                //             Text(
                //               'Singer Name',
                //               style: TextStyle(
                //                   fontSize: 13, color: Colors.grey.shade500),
                //             )
                //           ],
                //         ),
                //       ),
                //       Expanded(
                //         child: Container(
                //           height: 160,
                //           //color: Colors.yellow,
                //           child: Column(
                //             //crossAxisAlignment: CrossAxisAlignment.stretch,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             crossAxisAlignment: CrossAxisAlignment.end,
                //             children: [
                //               Container(
                //                 child: Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     SizedBox(),
                //                     GestureDetector(
                //                       onTap: () {
                //                         //   bottansheet(context);
                //                       },
                //                       child: Icon(
                //                         Icons.more_vert_outlined,
                //                         size: 30,
                //                         color: Colors.grey.shade500,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Container(
                //                 child: Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     // SizedBox(),
                //                     Icon(
                //                       Icons.play_circle_outline_outlined,
                //                       color: Colors.grey.shade500,
                //                       size: 40,
                //                     ),
                //                   ],
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'MOST PLAYED',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '${mostlayedsonglist.length.toString()} SONGS',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 10,
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: mostlayedsonglist.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          // swiper(
                          //     context: context,
                          //     myAudiolist: widget.myAudiolist,
                          //     index: index);
                          myminiplayer(
                              context: context,
                              myAudiolist: mostlayedsonglist,
                              index: index);
                          addrecent(id: mostlayedsonglist[index].id);
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: SizedBox(
                          height: 55,
                          width: 55,
                          child: QueryArtworkWidget(
                            artworkBorder: BorderRadius.circular(13),
                            id: int.parse(mostlayedsonglist[index].id),
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
                        title: Text(
                          mostlayedsonglist[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        subtitle: Text(
                          mostlayedsonglist[index].artist,
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
                                bottansheet(
                                    cxt: context,
                                    myaudiolist: mostlayedsonglist,
                                    index: index);
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
      ),
    );
  }
}
