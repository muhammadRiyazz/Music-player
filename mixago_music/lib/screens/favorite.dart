import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mixago_music/screens/widgets/bottomsheet.dart';
import 'package:mixago_music/screens/widgets/miniplayer.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
            children: [
              // SizedBox(
              //   height: 22,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Favorite',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    size: 20,
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                  // IconButton(onPressed: (){}, icon: I)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    //color: Colors.grey.withOpacity(0.17),
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
                            'asset/img/imgk.jpg',
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  bottansheet(context);
                                },
                                child: Icon(
                                  Icons.more_vert_outlined,
                                  size: 30,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.play_circle_outline_outlined,
                                color: Colors.grey.shade600,
                                size: 40,
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
                height: 8,
              ),
              Text(
                'Favorite Songs',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '33 Songs',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      fsonglist(
                          songimg: 'asset/img/imgd.jpg',
                          songname: 'Asik Suratm',
                          singer: 'Irmak Aricl',
                          cnxt: context),
                      fsonglist(
                          songimg: 'asset/img/imgg.jpg',
                          songname: 'Shinunoga',
                          singer: 'Fujii Kaze',
                          cnxt: context),
                      fsonglist(
                          songimg: 'asset/img/imga.jpg',
                          songname: 'Wonderful Life',
                          singer: 'Tavito Nanao',
                          cnxt: context),
                      fsonglist(
                          songimg: 'asset/img/imgc.jpg',
                          songname: 'Trust',
                          singer: 'Liza,Yo-Sea',
                          cnxt: context),
                      fsonglist(
                          songimg: 'asset/img/imge.jpg',
                          songname: 'Todai',
                          singer: 'Bialystocks',
                          cnxt: context),
                      fsonglist(
                          songimg: 'asset/img/imgw.jpg',
                          songname: 'Asik Suratm',
                          singer: 'Irmak Aricl',
                          cnxt: context),
                      fsonglist(
                          songimg: 'asset/img/imgk.jpg',
                          singer: 'Asik Suratm',
                          songname: 'Irmak Aricl',
                          cnxt: context),
                      fsonglist(
                          songimg: 'asset/img/imgd.jpg',
                          songname: 'Todai',
                          singer: 'Bialystocks',
                          cnxt: context),
                      fsonglist(
                          songimg: 'asset/img/imgw.jpg',
                          songname: 'Trust',
                          singer: 'Liza,Yo-Sea',
                          cnxt: context),
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

  fsonglist(
      {required String songimg, songname, singer, required BuildContext cnxt}) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          height: 50,
          width: 50,
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
              onTap: (() {
                // myminiplayer(cnxt);
              }),
              child: Icon(
                Icons.play_circle_outlined,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.favorite,
              color: Colors.red.shade900,
            ),
          ],
        ),
      ),
    );
  }
}
