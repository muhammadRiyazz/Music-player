import 'package:flutter/material.dart';
import 'package:mixago_music/modals/Musics.dart';

class SongCount extends StatelessWidget {
  const SongCount({
    Key? key,
    required this.searchmusic,
  }) : super(key: key);

  final List<Musics> searchmusic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All SONGS',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            '${searchmusic.length.toString()} Songs',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
