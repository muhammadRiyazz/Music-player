import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/library%20add%20functions/addrecent.dart';
import 'package:mixago_music/screens/widgets/bottomsheet.dart';
import 'package:mixago_music/screens/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../modals/Musics.dart';
import '../modals/database_function.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Box<List> librarybox = getlibrarybox();
    final List<Musics> favouriteSongsList =
        librarybox.get('Favourites')!.toList().cast<Musics>();

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Favorite',
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
            Box<List> librarybox = getlibrarybox();
            final List<Musics> favouriteSongsList =
                librarybox.get('Favourites')!.toList().cast<Musics>();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   padding: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //       //color: Colors.grey.withOpacity(0.17),
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
                //               'asset/img/imgk.jpg',
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
                //             crossAxisAlignment: CrossAxisAlignment.end,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 child: GestureDetector(
                //                   onTap: () {
                //                     //bottansheet(context);
                //                   },
                //                   child: Icon(
                //                     Icons.more_vert_outlined,
                //                     size: 30,
                //                     color: Colors.grey.shade500,
                //                   ),
                //                 ),
                //               ),
                //               Container(
                //                 child: Icon(
                //                   Icons.play_circle_outline_outlined,
                //                   color: Colors.grey.shade600,
                //                   size: 40,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                Text(
                  'FAVOURITE SONGS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '${favouriteSongsList.length} Songs',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: favouriteSongsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          // swiper(
                          //     context: context,
                          //     myAudiolist: widget.myAudiolist,
                          //     index: index);
                          myminiplayer(
                              context: context,
                              myAudiolist: favouriteSongsList,
                              index: index);
                          addrecent(id: favouriteSongsList[index].id);
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: SizedBox(
                          height: 55,
                          width: 55,
                          child: QueryArtworkWidget(
                            artworkBorder: BorderRadius.circular(13),
                            id: int.parse(favouriteSongsList[index].id),
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
                          favouriteSongsList[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        subtitle: Text(
                          favouriteSongsList[index].artist,
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
                                    myaudiolist: favouriteSongsList,
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
