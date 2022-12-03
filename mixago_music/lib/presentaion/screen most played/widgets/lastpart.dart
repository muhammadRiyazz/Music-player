import 'package:flutter/material.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/presentaion/main%20widget/songlist.dart';

class Lastpart extends StatelessWidget {
  const Lastpart({
    Key? key,
    required this.mostlayedsonglist,
  }) : super(key: key);

  final List<Musics> mostlayedsonglist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'MOST PLAYED',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Text(
          '${mostlayedsonglist.length.toString()} SONGS',
          style: TextStyle(color: Colors.grey.shade700),
        ),
        songlist(mysonglist: mostlayedsonglist),
      ],
    );
  }
}
