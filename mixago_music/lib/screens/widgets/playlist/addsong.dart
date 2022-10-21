import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

addsongplaylist(BuildContext context) {
  final size = MediaQuery.of(context).size;
  var myvisible = false;
  return showModalBottomSheet(
      backgroundColor: Color.fromARGB(0, 185, 32, 32),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GlassContainer(
                    color: Colors.black.withOpacity(0.4),
                    blur: 5,
                    borderRadius: BorderRadius.circular(10),
                    height: size.height * 0.60,
                    child: Container(
                      // decoration: BoxDecoration(
                      //   gradient: const LinearGradient(
                      //     colors: [
                      //       Color.fromARGB(255, 26, 12, 38),
                      //       Color.fromARGB(255, 0, 0, 0),
                      //     ],
                      //     begin: Alignment.bottomLeft,
                      //     end: Alignment.topRight,
                      //     stops: [0.1, 0.8],
                      //     tileMode: TileMode.repeated,
                      //   ),
                      // ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text(
                                'Play List Name',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 19),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Songs',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          if (myvisible == true) {
                                            myvisible = false;
                                          } else {
                                            myvisible = true;
                                          }
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.search_rounded,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                          ),
                          Visibility(
                            visible: myvisible,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: TextField(
                                style: TextStyle(color: Colors.grey.shade600),
                                decoration: InputDecoration(
                                  //focusColor: Colors.blue,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  fillColor:
                                      Colors.grey.shade800.withOpacity(0.3),
                                  filled: true,
                                  prefixIcon: Icon(
                                      color: Colors.grey.shade700,
                                      Icons.search),
                                  hintText: "search",
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  songlist(
                                      songimg: 'asset/img/imgd.jpg',
                                      songname: 'Asik Suratm',
                                      singer: 'Irmak Aricl',
                                      context: context),
                                  songlist(
                                      songimg: 'asset/img/imgg.jpg',
                                      songname: 'Shinunoga',
                                      singer: 'Fujii Kaze',
                                      context: context),
                                  songlist(
                                      songimg: 'asset/img/imga.jpg',
                                      songname: 'Wonderful Life',
                                      singer: 'Tavito Nanao',
                                      context: context),
                                  songlist(
                                      songimg: 'asset/img/imgc.jpg',
                                      songname: 'Trust',
                                      singer: 'Liza,Yo-Sea',
                                      context: context),
                                  songlist(
                                      songimg: 'asset/img/imge.jpg',
                                      songname: 'Todai',
                                      singer: 'Bialystocks',
                                      context: context),
                                  songlist(
                                      songimg: 'asset/img/imgw.jpg',
                                      songname: 'Asik Suratm',
                                      singer: 'Irmak Aricl',
                                      context: context),
                                  songlist(
                                      songimg: 'asset/img/imgk.jpg',
                                      singer: 'Asik Suratm',
                                      songname: 'Irmak Aricl',
                                      context: context),
                                  songlist(
                                      songimg: 'asset/img/imgd.jpg',
                                      songname: 'Todai',
                                      singer: 'Bialystocks',
                                      context: context),
                                  songlist(
                                      songimg: 'asset/img/imgw.jpg',
                                      songname: 'Trust',
                                      singer: 'Liza,Yo-Sea',
                                      context: context),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GlassContainer(
                    borderRadius: BorderRadius.circular(14),
                    blur: 5,
                    color: Colors.black54.withOpacity(0.5),
                    height: 40,
                    width: double.infinity,
                    child: Center(child: Text('Cancel')),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          );
        });
      });
}

songlist({required String songimg, songname, singer, required context}) {
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
    trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.add_circle_outline_rounded,
          color: Colors.grey.shade700,
        )),
  );
}
