import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:mixago_music/presentaion/screen%20now%20playing/now_playing.dart';

class Progressbar extends StatelessWidget {
  const Progressbar(
      {Key? key, required, required this.Mysize, required this.audioPlayer})
      : super(key: key);

  final Size Mysize;
  final AssetsAudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Mysize.height * 0.02,
          bottom: Mysize.height * 0.02,
          left: Mysize.width * 0.15,
          right: Mysize.width * 0.15),
      child: audioPlayer.builderRealtimePlayingInfos(
          builder: (context, realtimePlayingInfos) {
        return ProgressBar(
          progress: realtimePlayingInfos.currentPosition,
          total: realtimePlayingInfos.duration,
          timeLabelPadding: 8,
          //progressBarColor: Colors.grey.shade100,
          timeLabelTextStyle: const TextStyle(color: Colors.grey),
          onSeek: (value) {
            audioPlayer.seek(value);
          },
        );
      }),
    );
  }
}
