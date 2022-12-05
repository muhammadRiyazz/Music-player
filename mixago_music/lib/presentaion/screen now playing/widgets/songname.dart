import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class songname extends StatelessWidget {
  const songname({Key? key, required this.musicplayer}) : super(key: key);
  final AssetsAudioPlayer musicplayer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SizedBox(
        width: 160,
        child: Text(
          musicplayer.getCurrentAudioTitle,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400,
              fontSize: 19),
        ),
      ),
    );
  }
}
