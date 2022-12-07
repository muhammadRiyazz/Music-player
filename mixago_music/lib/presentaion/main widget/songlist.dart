import 'package:flutter/material.dart';
import 'package:mixago_music/functions/recent/addrecent.dart';
import 'package:mixago_music/modals/musics/Musics.dart';
import 'package:mixago_music/presentaion/main%20widget/miniplayer/miniplayer.dart';
import 'package:mixago_music/presentaion/main%20widget/bottomsheet.dart';
import 'package:on_audio_query/on_audio_query.dart';

class songlist extends StatelessWidget {
  const songlist({
    Key? key,
    required this.mysonglist,
  }) : super(key: key);

  final List<Musics> mysonglist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: mysonglist.isEmpty
          ? const Center(
              child: Text('No Songs'),
            )
          : ListView.builder(
              itemCount: mysonglist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    myminiplayer(
                        context: context,
                        myAudiolist: mysonglist,
                        index: index);
                    addrecent(id: mysonglist[index].id, context: context);
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: SizedBox(
                    height: 55,
                    width: 55,
                    child: QueryArtworkWidget(
                      artworkBorder: BorderRadius.circular(13),
                      id: int.parse(mysonglist[index].id),
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
                    mysonglist[index].title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(
                    mysonglist[index].artist,
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
                              myaudiolist: mysonglist,
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
    );
  }
}
