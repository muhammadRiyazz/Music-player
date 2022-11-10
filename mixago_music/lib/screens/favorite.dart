import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
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

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    Box<List> librarybox = getlibrarybox();
    final List<Musics> favouriteSongsList =
        librarybox.get('Favourites')!.toList().cast<Musics>();

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
        child: ValueListenableBuilder(
          valueListenable: librarybox.listenable(),
          builder: (BuildContext context, Box<List> value, Widget? child) {
            Box<List> librarybox = getlibrarybox();
            final List<Musics> favouriteSongsList =
                librarybox.get('Favourites')!.toList().cast<Musics>();

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
                  '${favouriteSongsList.length} Songs',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                Expanded(
                  child: favouriteSongsList.isEmpty
                      ? const Center(
                          child: Text('No Songs'),
                        )
                      : ListView.builder(
                          itemCount: favouriteSongsList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
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
