import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:mixago_music/presentaion/screen%20now%20playing/now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';

class swiper extends StatelessWidget {
  const swiper(
      {Key? key,
      required this.myswipercontroller,
      required this.msize,
      required this.mymusic,
      required this.mylist,
      required this.mymusicplayer})
      : super(key: key);

  final SwiperController myswipercontroller;
  final Size msize;
  final Audio mymusic;
  final AssetsAudioPlayer mymusicplayer;
  final List<Audio> mylist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: msize.height * 0.45,
      width: msize.width,
      child: Swiper(
        /// index: widget.mymusicplayer,
        itemCount: mylist.length,
        controller: myswipercontroller,
        itemBuilder: (context, index) {
          return QueryArtworkWidget(
            artworkBorder: BorderRadius.circular(13),
            id: int.parse(mymusic.metas.id!),
            type: ArtworkType.AUDIO,
            nullArtworkWidget: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'asset/img/music.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,

        onIndexChanged: (index) {
          mymusicplayer.next();
        },
        viewportFraction: 0.75,
        scale: 0.7,
      ),
    );
  }
}
