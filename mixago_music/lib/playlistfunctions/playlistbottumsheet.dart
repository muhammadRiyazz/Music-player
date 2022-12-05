import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/Appilcations/bloc%20file/favourites/favourites_bloc.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:share_plus/share_plus.dart';

import '../../modals/database_function.dart';
import '../Appilcations/bloc file/playlistsong/playlistsong_bloc.dart';

bottansheetinplaylistlisttile(
    {required BuildContext cxt,
    required List<Musics> myaudiolist,
    required int index,
    required String key}) {
  final size = MediaQuery.of(cxt).size;

  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: const Color.fromARGB(0, 223, 157, 157),
      context: cxt,
      builder: (BuildContext context) {
        Box<List> librarybox = getlibrarybox();
        return Container(
          // height: ,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            GlassContainer(
              borderRadius: BorderRadius.circular(25),
              blur: 5,
              color: Colors.black54.withOpacity(0.5),
              //height: size.height * 0.47,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: size.height * 0.20,
                    width: size.width * 0.54,
                    child: QueryArtworkWidget(
                      artworkFit: BoxFit.cover,
                      artworkBorder: BorderRadius.circular(13),
                      id: int.parse(myaudiolist[index].id),
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
                  SizedBox(
                    width: size.width * 0.5,
                    child: Center(
                      child: Text(
                        myaudiolist[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: size.width * 0.4,
                      child: Center(
                        child: Text(myaudiolist[index].artist,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13)),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      BlocProvider.of<PlaylistsongBloc>(context).add(
                          blocsongremove(
                              id: myaudiolist[index].id,
                              listkey: key,
                              context: context));

                      Navigator.pop(context);
                    },
                    iconColor: Colors.grey,
                    textColor: Colors.grey,
                    title: const Text(
                      'Remove From Playlist',
                    ),
                    leading: const Icon(Icons.playlist_remove),
                  ),
                  BlocBuilder<FavouritesBloc, FavouritesState>(
                    builder: (context, state) {
                      BlocProvider.of<FavouritesBloc>(context).add(Iconchange(
                        id: myaudiolist[index].id,
                      ));

                      return ListTile(
                        onTap: () {
                          BlocProvider.of<FavouritesBloc>(context).add(
                              Listchanging(
                                  id: myaudiolist[index].id, context: context));
                          BlocProvider.of<FavouritesBloc>(context)
                              .add(Iconchange(
                            id: myaudiolist[index].id,
                          ));
                          Navigator.pop(context);
                        },
                        iconColor: Colors.grey,
                        textColor: Colors.grey,
                        title: Text(
                          state.text,
                        ),
                        leading: state.icon,
                      );
                    },
                  ),
                  ListTile(
                    onTap: () async {
                      await Share.share('..');
                    },
                    iconColor: Colors.grey,
                    textColor: Colors.grey,
                    title: const Text('Share'),
                    leading: const Icon(Icons.ios_share_outlined),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: GlassContainer(
                borderRadius: BorderRadius.circular(14),
                blur: 5,
                color: Colors.black54.withOpacity(0.5),
                height: size.height * 0.05,
                width: double.infinity,
                child: const Center(child: Text('Cancel')),
              ),
            ),
            SizedBox(height: size.height * 0.01),
          ]),
        );
      });
}
