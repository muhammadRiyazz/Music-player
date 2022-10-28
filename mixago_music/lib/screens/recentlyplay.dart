import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mixago_music/screens/widgets/bottomsheet.dart';
import 'package:mixago_music/screens/widgets/miniplayer.dart';

class RecentPlay extends StatefulWidget {
  const RecentPlay({super.key});

  @override
  State<RecentPlay> createState() => _RecentPlayState();
}

class _RecentPlayState extends State<RecentPlay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Recent played',
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
          padding: EdgeInsets.all(10),
          //color: Colors.black,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
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
                            'asset/img/imgb.jpg',
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
                                      //  bottansheet(context);
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
                height: size.height * 0.012,
              ),
              Text(
                'Recent Played',
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
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      recentsonglist(
                        songimg: 'asset/img/imgd.jpg',
                        songname: 'Asik Suratm',
                        singer: 'Irmak Aricl',
                      ),
                      recentsonglist(
                        songimg: 'asset/img/imgg.jpg',
                        songname: 'Shinunoga',
                        singer: 'Fujii Kaze',
                      ),
                      recentsonglist(
                        songimg: 'asset/img/imga.jpg',
                        songname: 'Wonderful Life',
                        singer: 'Tavito Nanao',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  recentsonglist({required String songimg, songname, singer}) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        height: 55,
        width: 55,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(fit: BoxFit.cover, songimg),
        ),
      ),
      title: Text(
        songname,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: Text(
        singer,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              //myminiplayer(context);
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
              Icons.more_vert_outlined,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
