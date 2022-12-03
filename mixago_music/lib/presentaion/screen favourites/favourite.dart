import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/favourites/favourites_bloc.dart';
import 'package:mixago_music/presentaion/main%20widget/songlist.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.grey.shade300),
        title: Text(
          'FavouriteS'.toUpperCase(),
          style: TextStyle(color: Colors.grey.shade300),
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
        child:
            // ValueListenableBuilder(
            //   valueListenable: librarybox.listenable(),
            //   builder: (BuildContext context, Box<List> value, Widget? child) {
            //     Box<List> librarybox = getlibrarybox();
            //     final List<Musics> favouriteSongsList =
            //         librarybox.get('Favourites')!.toList().cast<Musics>();

            BlocBuilder<FavouritesBloc, FavouritesState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'FAVOURITE SONGS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Text(
                  '${state.favouritelist.length} Songs',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                songlist(mysonglist: state.favouritelist)
              ],
            );
          },
        ),
      ),
    );
  }
}
