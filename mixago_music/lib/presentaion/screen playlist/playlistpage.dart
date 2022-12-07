import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlist/playlist_bloc.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlistsong/playlistsong_bloc.dart';
import 'package:mixago_music/presentaion/screen%20playlist/widgets/add_to_palylist_bottan_sheet.dart';

import 'package:mixago_music/presentaion/screen%20playlist/widgets/rename_delete_sheet.dart';
import 'package:mixago_music/presentaion/screen%20playlist/widgets/song_list.dart';
import 'widgets/createplaylist.dart';

class plalistpage extends StatefulWidget {
  const plalistpage({
    super.key,
    this.id,
  });
  final String? id;

  @override
  State<plalistpage> createState() => _plalistpageState();
}

class _plalistpageState extends State<plalistpage> {
  PageController mycontroller = PageController();
  final createplaylistcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BlocProvider.of<PlaylistBloc>(context).add(const Initialplaylists());

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey.shade300),
        backgroundColor: Colors.black,
        title: Text(
          'Playlist'.toUpperCase(),
          style: TextStyle(color: Colors.grey.shade300),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Createplaylist(
              createplaylistcontroller: createplaylistcontroller,
              size: size,
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            SizedBox(
              height: size.height * 0.14,
              //  color: Colors.blue,
              child: BlocBuilder<PlaylistBloc, PlaylistState>(
                builder: (context, state) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: size.width * 0.025,
                      );
                    },
                    itemCount: state.playlist.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (widget.id != null) {
                            BlocProvider.of<PlaylistsongBloc>(context)
                                .add(Songadd(
                              id: widget.id.toString(),
                              listkey: state.playlist[index],
                              context: context,
                            ));

                            Navigator.pop(context);
                          }

                          mycontroller.jumpToPage(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 26, 12, 38),
                                  Color.fromARGB(69, 59, 56, 56)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [0.2, 0.8],
                                tileMode: TileMode.repeated,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          width: size.width * 0.50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 10, bottom: 3),
                                      child: SizedBox(
                                        width: 105,
                                        child: Text(
                                          state.playlist[index]
                                              .toString()
                                              .toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.04,
                                              color: Colors.grey.shade500),
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 8),
                                    //   child: BlocBuilder<PlaylistsongBloc,
                                    //       PlaylistsongState>(
                                    //     builder: (context, state) {
                                    //       return Text(
                                    //         '${state.musiclist.length} Songs',
                                    //         style: TextStyle(
                                    //             fontSize: 12,
                                    //             color: Colors.grey.shade700),
                                    //       );
                                    //     },
                                    //   ),
                                    // )
                                  ]),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 7),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        playlistsbottansheet(
                                            context: context,
                                            key: state.playlist[index]);
                                      },
                                      child: const Icon(
                                        Icons.menu,
                                        size: 27,
                                        color:
                                            Color.fromARGB(159, 167, 154, 154),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            PageViewsongs(),
          ],
        ),
      ),
    );
  }

  PageViewsongs() {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        return state.playlist.isEmpty
            ? Column(
                children: [
                  SizedBox(
                    height: size.width * 0.5,
                  ),
                  const Center(
                    child: Text('No Playlist'),
                  ),
                ],
              )
            : Expanded(
                child: PageView.builder(
                  controller: mycontroller,
                  itemCount: state.playlist.length,
                  itemBuilder: (context, keyindex) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.02),
                          child: Text(
                            state.playlist[keyindex].toString().toUpperCase(),
                            style: TextStyle(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: BlocBuilder<PlaylistsongBloc,
                                  PlaylistsongState>(
                                builder: (context, state) {
                                  return Text(
                                    '${state.musiclist.length} SONGS',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 0.034,
                                    ),
                                  );
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                addsongplaylist(
                                  ctxt: context,
                                  keys: state.playlist[keyindex],
                                );
                              },
                              icon: const Icon(
                                Icons.playlist_add,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        listview(
                          size: size,
                          playlistkeys: state.playlist,
                          keyindex: keyindex,
                        ),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }
}
