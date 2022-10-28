import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mixago_music/screens/widgets/bottomsheet.dart';
import 'package:mixago_music/screens/widgets/miniplayer.dart';

class MostPlay extends StatefulWidget {
  const MostPlay({super.key});

  @override
  State<MostPlay> createState() => _MostPlayState();
}

class _MostPlayState extends State<MostPlay> {
  @override
  Widget build(BuildContext context) {
    final AssetsAudioPlayer mymusicplayer = AssetsAudioPlayer();

    List<Audio> Musiclist = [
      Audio(
        'asset/music/Bandish Bandits (Original Motion Picture Soundtrack) CD 1 TR.mp3',
        metas: Metas(
            title: 'Asik Suratm',
            artist: 'Irmak Aricl',
            image: const MetasImage.asset(
              'asset/img/imgd.jpg',
            )),
      ),
      Audio(
        'asset/music/Duniyaa.mp3',
        metas: Metas(
            title: 'Hosh-Nikk',
            artist: 'alvin_jhon',
            image: const MetasImage.asset(
              'asset/img/imge.jpg',
            )),
      ),
      Audio(
        'asset/music/Hosh - Nikk.mp3',
        metas: Metas(
            title: 'Shinunoga',
            artist: 'Fujii Kaze',
            image: const MetasImage.asset(
              'asset/img/imgk.jpg',
            )),
      ),
      Audio(
        'asset/music/Lailakame.mp3',
        metas: Metas(
          title: 'Hosh-Nikk',
          artist: 'alvin_jhon',
          image: const MetasImage.asset(
            'asset/img/imgj.jpg',
          ),
        ),
      ),
      Audio(
        'asset/music/Mungda.mp3',
        metas: Metas(
            title: 'Asik Suratm',
            artist: 'Irmak Aricl',
            image: const MetasImage.asset(
              'asset/img/imgg.jpg',
            )),
      ),
      Audio(
        'asset/music/The Daaku Anthem.mp3',
        metas: Metas(
            title: 'Shinunoga',
            artist: 'Fujii Kaze',
            image: const MetasImage.asset(
              'asset/img/imgc.jpg',
            )),
      ),
    ];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Most Played',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 26, 12, 38),
                Color.fromARGB(255, 0, 0, 0)
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.2, 0.8],
              tileMode: TileMode.repeated,
            ),
          ),
          padding: EdgeInsets.all(15),
          //color: Colors.black,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 22,
              // ),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    //color: Colors.white12.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      height: size.width * 0.45,
                      width: size.width * 0.45,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'asset/img/imge.jpg',
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      //  color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 5,
                          // ),
                          Text(
                            'Song Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Singer Name',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 160,
                        //color: Colors.yellow,
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  GestureDetector(
                                    onTap: () {
                                      //   bottansheet(context);
                                    },
                                    child: Icon(
                                      Icons.more_vert_outlined,
                                      size: 30,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // SizedBox(),
                                  Icon(
                                    Icons.play_circle_outline_outlined,
                                    color: Colors.grey.shade500,
                                    size: 40,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Most Played',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Songs',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: Musiclist.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SizedBox(
                            height: 55,
                            width: 55,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                  fit: BoxFit.cover,
                                  Musiclist[index].metas.image!.path),
                            ),
                          ),
                          title: Text(
                            '${Musiclist[index].metas.title}',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          subtitle: Text(
                            '${Musiclist[index].metas.artist}',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  mymusicplayer.play();
                                  //myminiplayer(context);

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const NowPlaying()),
                                  // );
                                },
                                child: Icon(
                                  Icons.play_circle_outlined,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // bottansheet(context);
                                },
                                child: Icon(
                                  Icons.more_vert_rounded,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
