import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/recent/recent_bloc.dart';
import 'package:mixago_music/presentaion/main%20widget/songlist.dart';

class RecentPlay extends StatelessWidget {
  const RecentPlay({super.key});

  @override
  Widget build(BuildContext context) {
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
          child:
              //  ValueListenableBuilder(
              //     valueListenable: librarybox.listenable(),
              //     builder: (BuildContext context, Box<List> value, Widget? child) {
              //       Box<List> librarybox = getlibrarybox();
              //       final List<Musics> recentSongsList =
              //           librarybox.get('recent Played')!.toList().cast<Musics>();

              BlocBuilder<RecentBloc, RecentState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'RECENT PLAYED',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Text(
                    '${state.recentsonglist.length} SONGS ',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  songlist(mysonglist: state.recentsonglist),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
