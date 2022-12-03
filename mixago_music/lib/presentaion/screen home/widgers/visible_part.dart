import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/presentaion/screen%20home/widgers/Play_list_container.dart';
import 'package:mixago_music/presentaion/screen%20home/widgers/librarylist.dart';

class VisibilityPart extends StatelessWidget {
  const VisibilityPart({
    Key? key,
    required this.libraryvsible,
    required this.size,
    required this.favouriteSongsList,
    required this.mostlayedsonglist,
    required this.recentsonglist,
    required this.alllibrary,
  }) : super(key: key);

  final bool libraryvsible;
  final Size size;
  final List<Musics> favouriteSongsList;
  final List<Musics> mostlayedsonglist;
  final List<Musics> recentsonglist;
  final Box<List> alllibrary;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: libraryvsible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              'LIBRARY',
              style: TextStyle(
                  color: (Colors.grey.shade400),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          LibraryList(
            size: size,
            favouriteSongsList: favouriteSongsList,
            mostlayedsonglist: mostlayedsonglist,
            recentsonglist: recentsonglist,
            alllibrary: alllibrary,
          ),
          PlayListContainer(size: size),
        ],
      ),
    );
  }
}
