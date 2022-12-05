import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlistsong/playlistsong_bloc.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:on_audio_query/on_audio_query.dart';

addsongplaylist({required BuildContext ctxt, required String keys}) {
  final size = MediaQuery.of(ctxt).size;

  return showModalBottomSheet(
      backgroundColor: const Color.fromARGB(0, 185, 32, 32),
      context: ctxt,
      isScrollControlled: true,
      builder: (BuildContext context) {
        Box<Musics> songlisbox = getsongsmodalbox();
        List<Musics> mysongslist = songlisbox.values.toList();
        return Padding(
          padding: EdgeInsets.only(
            left: size.height * 0.01,
            right: size.height * 0.01,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GlassContainer(
                color: Colors.black.withOpacity(0.6),
                blur: 5,
                borderRadius: BorderRadius.circular(10),
                height: size.height * 0.60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 5, top: 15, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'All SONGS',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            '${mysongslist.length.toString()} Songs',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: (mysongslist.isEmpty)
                            ? const Center(
                                child: Text('No Songs'),
                              )
                            : ListView.builder(
                                itemCount: mysongslist.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: SizedBox(
                                      height: 55,
                                      width: 55,
                                      child: QueryArtworkWidget(
                                        artworkBorder:
                                            BorderRadius.circular(13),
                                        id: int.parse(mysongslist[index].id),
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
                                      mysongslist[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    subtitle: Text(
                                      mysongslist[index].artist,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<PlaylistsongBloc>(
                                                context)
                                            .add(Songadd(
                                                id: mysongslist[index].id,
                                                listkey: keys,
                                                context: context));
                                      },
                                      icon: const Icon(
                                        Icons.add_box_outlined,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.011,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: GlassContainer(
                  borderRadius: BorderRadius.circular(10),
                  blur: 5,
                  color: Colors.black54.withOpacity(0.5),
                  height: size.height * 0.05,
                  width: double.infinity,
                  child: const Center(child: Text('Cancel')),
                ),
              ),
              SizedBox(
                height: size.height * 0.011,
              ),
            ],
          ),
        );
      });
}
