import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/modals/musics/Musics.dart';
import 'package:mixago_music/presentaion/screen%20favourites/favourite.dart';
import 'package:mixago_music/presentaion/screen%20home/widgers/library.dart';
import 'package:mixago_music/presentaion/screen%20most%20played/mostplayed.dart';
import 'package:mixago_music/presentaion/screen%20recent%20played/recentplay.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({
    Key? key,
    required this.size,
    required this.favouriteSongsList,
    required this.mostlayedsonglist,
    required this.recentsonglist,
    required this.alllibrary,
  }) : super(key: key);

  final Size size;
  final List<Musics> favouriteSongsList;
  final List<Musics> mostlayedsonglist;
  final List<Musics> recentsonglist;
  final Box<List> alllibrary;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, Box<List> value, Widget? child) {
        return SizedBox(
          height: size.height * 0.12,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Library(
                context: context,
                libraryname: 'FAVOURITES',
                onpress: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Favorite();
                  },
                )),
                songcount: favouriteSongsList.length.toString(),
              ),
              Library(
                context: context,
                libraryname: 'MOST PLAYED',
                onpress: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const MostPlay();
                  },
                )),
                songcount: mostlayedsonglist.length.toString(),
              ),
              Library(
                  songcount: recentsonglist.length.toString(),
                  onpress: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const RecentPlay();
                        },
                      )),
                  context: context,
                  libraryname: 'RECENT PLAYED'),
            ],
          ),
        );
      },
      valueListenable: alllibrary.listenable(),
    );
  }
}
