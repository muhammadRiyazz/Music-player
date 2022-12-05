// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:mixago_music/Appilcations/bloc%20file/favourites/favourites_bloc.dart';
// import 'package:mixago_music/modals/Musics.dart';
// import 'package:flutter/material.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';
// import '../../modals/database_function.dart';

// Future tofavoritehivebox(
//     {required String id, required BuildContext context}) async {
//   // Box<List> librarybox = getlibrarybox();
//   // Box<Musics> songsbox = getsongsmodalbox();
//   // final List<Musics> allsongslist = songsbox.values.toList();
//   // final List<Musics> favouriteSongsList =
//   //     librarybox.get('Favourites')!.toList().cast<Musics>();
//   // final fvrtmusic = allsongslist.firstWhere(
//   //   (song) => song.id.contains(id),
//   // );
//   // if (favouriteSongsList.where((song) => fvrtmusic.id == song.id).isEmpty) {
//   //   favouriteSongsList.add(fvrtmusic);
//   //   await librarybox.put('Favourites', favouriteSongsList);
//   //   BlocProvider.of<FavouritesBloc>(context).add(const Listchanging());
//   //   showTopSnackBar(
//   //       context,
//   //       CustomSnackBar.success(
//   //         textScaleFactor: 0.8,
//   //         iconPositionLeft: 2,
//   //         backgroundColor: const Color.fromARGB(255, 24, 24, 33),
//   //         messagePadding: EdgeInsets.zero,
//   //         borderRadius: const BorderRadius.all(Radius.circular(15)),
//   //         message: 'Added To Favourite'.toUpperCase(),
//   //       ));
//   // } else {
//   //   favouriteSongsList.removeWhere((song) => fvrtmusic.id == song.id);
//   //   await librarybox.put('Favourites', favouriteSongsList);
//   //   BlocProvider.of<FavouritesBloc>(context).add(const Listchanging());

//   //   showTopSnackBar(
//   //       context,
//   //       CustomSnackBar.error(
//   //           textScaleFactor: 0.8,
//   //           iconPositionLeft: 2,
//   //           backgroundColor: const Color.fromARGB(255, 24, 24, 33),
//   //           messagePadding: EdgeInsets.zero,
//   //           borderRadius: const BorderRadius.all(Radius.circular(15)),
//   //           message: 'Removed From Favourite'.toUpperCase()));
//   // }
// }

// // Widget textfvrtaddremove({required String id, required BuildContext snakctxt}) {
// //   Box<List> librarybox = getlibrarybox();

// //   Box<Musics> songsbox = getsongsmodalbox();

// //   final List<Musics> allsongslist = songsbox.values.toList();

// //   final List<Musics> favouriteSongsList =
// //       librarybox.get('Favourites')!.toList().cast<Musics>();

// //   final fvrtmusic = allsongslist.firstWhere(
// //     (song) => song.id.contains(id),
// //   );

// //   if (favouriteSongsList.where((song) => fvrtmusic.id == song.id).isEmpty) {
// //     return ListTile(
// //       onTap: () {
// //         tofavoritehivebox(id: id, context: snakctxt);
// //       },
// //       iconColor: Colors.grey,
// //       textColor: Colors.grey,
// //       title: const Text('Add To Favorites'),
// //       leading: const Icon(Icons.favorite_border),
// //     );
// //   } else {
// //     favouriteSongsList.removeWhere((song) => fvrtmusic.id == song.id);
// //     return
// //     ListTile(
// //       onTap: () {
// //         tofavoritehivebox(id: id, context: snakctxt);
// //       },
// //       iconColor: Colors.red,
// //       textColor: Colors.grey,
// //       title: const Text('Remove From Favorites'),
// //       leading: const Icon(Icons.favorite),
// //     );
// //   }
// // }

// Widget iconfavourite({required String id, required BuildContext snakctxt}) {
//   Box<List> librarybox = getlibrarybox();
//   Box<Musics> songsbox = getsongsmodalbox();
//   final List<Musics> allsongslist = songsbox.values.toList();
//   final List<Musics> favouriteSongsList =
//       librarybox.get('Favourites')!.toList().cast<Musics>();
//   final fvrtmusic = allsongslist.firstWhere(
//     (song) => song.id.contains(id),
//   );
//   if (favouriteSongsList.where((song) => fvrtmusic.id == song.id).isEmpty) {
//     return GestureDetector(
//       onTap: () {
//         tofavoritehivebox(id: id, context: snakctxt);
//       },
//       child: const Icon(
//         Icons.favorite_outline,
//         color: Colors.grey,
//       ),
//     );
//   } else {
//     favouriteSongsList.removeWhere((song) => fvrtmusic.id == song.id);
//     return GestureDetector(
//       onTap: () {
//         tofavoritehivebox(id: id, context: snakctxt);
//       },
//       child: const Icon(
//         Icons.favorite,
//         color: Colors.red,
//       ),
//     );
//   }
// }
