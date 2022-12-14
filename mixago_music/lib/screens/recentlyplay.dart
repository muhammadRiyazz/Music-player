import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/library%20add%20functions/addrecent.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/screens/widgets/bottomsheet.dart';
import 'package:mixago_music/screens/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

class RecentPlay extends StatefulWidget {
  const RecentPlay({super.key});

  @override
  State<RecentPlay> createState() => _RecentPlayState();
}

class _RecentPlayState extends State<RecentPlay> {
  @override
  Widget build(BuildContext context) {
    Box<List> librarybox = getlibrarybox();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.grey.shade300),
        title: Text(
          'Recent played'.toUpperCase(),
          style: TextStyle(color: Colors.grey.shade300),
        ),
      ),
      body: SafeArea(
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
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          //color: Colors.black,
          child: ValueListenableBuilder(
              valueListenable: librarybox.listenable(),
              builder: (BuildContext context, Box<List> value, Widget? child) {
                Box<List> librarybox = getlibrarybox();
                final List<Musics> recentSongsList =
                    librarybox.get('recent Played')!.toList().cast<Musics>();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'RECENT PLAYED',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text(
                      '${recentSongsList.length.toString()} SONGS ',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    Expanded(
                      child: recentSongsList.isEmpty
                          ? const Center(
                              child: Text('No Songs'),
                            )
                          : ListView.builder(
                              itemCount: recentSongsList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    // swiper(
                                    //     context: context,
                                    //     myAudiolist: widget.myAudiolist,
                                    //     index: index);
                                    myminiplayer(
                                        context: context,
                                        myAudiolist: recentSongsList,
                                        index: index);
                                    addrecent(id: recentSongsList[index].id);
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  leading: SizedBox(
                                    height: 55,
                                    width: 55,
                                    child: QueryArtworkWidget(
                                      artworkBorder: BorderRadius.circular(13),
                                      id: int.parse(recentSongsList[index].id),
                                      type: ArtworkType.AUDIO,
                                      nullArtworkWidget: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          'asset/img/music.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    recentSongsList[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  subtitle: Text(
                                    recentSongsList[index].artist,
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
                                              myaudiolist: recentSongsList,
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
              }),
        ),
      ),
    );
  }
}
