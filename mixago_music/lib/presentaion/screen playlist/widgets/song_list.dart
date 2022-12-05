import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlistsong/playlistsong_bloc.dart';
import 'package:mixago_music/library%20add%20functions/addrecent.dart';
import 'package:mixago_music/playlistfunctions/playlistbottumsheet.dart';
import 'package:mixago_music/presentaion/main%20widget/miniplayer/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

class listview extends StatelessWidget {
  const listview({
    Key? key,
    // required this.Playlistsongs,
    required this.size,
    required this.playlistkeys,
    required this.keyindex,
  }) : super(key: key);

  //final List<Musics> Playlistsongs;
  final Size size;
  final List playlistkeys;
  final int keyindex;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PlaylistsongBloc>(context)
        .add(Initialsonglist(listkey: playlistkeys[keyindex]));

    return BlocBuilder<PlaylistsongBloc, PlaylistsongState>(
      builder: (context, state) {
        return Expanded(
          child: (state.musiclist.isEmpty)
              ? const Center(
                  child: Text('No Songs'),
                )
              : ListView.builder(
                  itemCount: state.musiclist.length,
                  itemBuilder: (mycontext, Index) {
                    return ListTile(
                      onTap: () {
                        myminiplayer(
                            context: mycontext,
                            myAudiolist: state.musiclist,
                            index: Index);
                        addrecent(
                            id: state.musiclist[Index].id, context: mycontext);
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: SizedBox(
                        height: size.height * 0.07,
                        width: size.width * 0.15,
                        child: QueryArtworkWidget(
                          artworkBorder: BorderRadius.circular(13),
                          id: int.parse(state.musiclist[Index].id),
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
                        state.musiclist[Index].title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      subtitle: Text(
                        state.musiclist[Index].artist,
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
                              bottansheetinplaylistlisttile(
                                  cxt: mycontext,
                                  myaudiolist: state.musiclist,
                                  index: Index,
                                  key: playlistkeys[keyindex]);
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
        );
      },
    );
  }
}
