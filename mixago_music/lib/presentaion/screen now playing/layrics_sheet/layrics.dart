import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mixago_music/lyrics/lyricsget.dart';
import 'package:mixago_music/presentaion/screen%20now%20playing/layrics_sheet/layrics_sheet.dart';

class layrics extends StatelessWidget {
  const layrics(
      {Key? key,
      required this.context,
      required this.mysize,
      required this.newaudioPlayer})
      : super(key: key);

  final BuildContext context;
  final Size mysize;
  final AssetsAudioPlayer newaudioPlayer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: mysize.width * 0.10,
          // top: mysize.height * 0.02,
          right: mysize.width * 0.10),
      child: GestureDetector(
        onTap: () async {
          String lyricsstring = await getlyrics(
              myartist: newaudioPlayer.getCurrentAudioArtist,
              mytitle: newaudioPlayer.getCurrentAudioTitle);
          lyricsbottumsheet(context: context, larics: lyricsstring);
        },
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 35, 22, 46),
                  Color.fromARGB(255, 36, 29, 29)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.2, 0.8],
                tileMode: TileMode.repeated,
              ),
              // color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          height: mysize.height * 0.08,
          width: double.infinity,
          child: Center(
              child: Text(
            'LYRICS',
            style: TextStyle(
                letterSpacing: 2,
                fontSize: 14,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
