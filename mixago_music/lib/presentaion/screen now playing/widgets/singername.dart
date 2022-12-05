import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class singername extends StatelessWidget {
  const singername({
    required this.audioPlayer,
    Key? key,
  }) : super(key: key);
  final AssetsAudioPlayer audioPlayer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Text(
        audioPlayer.getCurrentAudioArtist,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Color.fromARGB(255, 241, 222, 222), fontSize: 14),
      ),
    );
  }
}
