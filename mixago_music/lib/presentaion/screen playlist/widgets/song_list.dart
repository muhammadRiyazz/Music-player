import 'package:flutter/material.dart';
import 'package:mixago_music/library%20add%20functions/addrecent.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/playlistfunctions/playlistbottumsheet.dart';
import 'package:mixago_music/screens/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

class listview extends StatelessWidget {
  const listview({
    Key? key,
    required this.Playlistsongs,
    required this.size,
    required this.playlistkeys,
    required this.keyindex,
  }) : super(key: key);

  final List<Musics> Playlistsongs;
  final Size size;
  final List playlistkeys;
  final int keyindex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (Playlistsongs.isEmpty)
          ? const Center(
              child: Text('No Songs'),
            )
          : ListView.builder(
              itemCount: Playlistsongs.length,
              itemBuilder: (context, Index) {
                return ListTile(
                  onTap: () {
                    myminiplayer(
                        context: context,
                        myAudiolist: Playlistsongs,
                        index: Index);
                    addrecent(id: Playlistsongs[Index].id, context: context);
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: size.height * 0.07,
                    width: size.width * 0.15,
                    child: QueryArtworkWidget(
                      artworkBorder: BorderRadius.circular(13),
                      id: int.parse(Playlistsongs[Index].id),
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
                    Playlistsongs[Index].title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(
                    Playlistsongs[Index].artist,
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
                              cxt: context,
                              myaudiolist: Playlistsongs,
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
  }
}
