// // import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
// import 'package:glassmorphism_ui/glassmorphism_ui.dart';

// playlistsongbottansheet(BuildContext context) {
//   final size = MediaQuery.of(context).size;
//   return showModalBottomSheet(
//       isScrollControlled: true,
//       backgroundColor: Color.fromARGB(0, 223, 157, 157),
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Column(mainAxisSize: MainAxisSize.min, children: [
//             GlassContainer(
//               borderRadius: BorderRadius.circular(20),
//               blur: 5,
//               color: Colors.black54.withOpacity(0.5),
//               // height: size.height * 0.55,
//               child: Column(
//                 children: [
//                   Container(
//                       //color: Colors.yellow,
//                       padding: EdgeInsets.all(16),
//                       height: size.height * 0.20,
//                       width: size.width * 0.54,
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Image.asset(
//                               fit: BoxFit.cover, 'asset/img/imgc.jpg'))),
//                   const Text(
//                     'Song Name',
//                     style: TextStyle(color: Colors.grey, fontSize: 16),
//                   ),
//                   const Text('Singer Name',
//                       style: TextStyle(color: Colors.grey, fontSize: 10)),
//                   const ListTile(
//                     iconColor: Colors.grey,
//                     textColor: Colors.grey,
//                     title: Text(
//                       'Remove From This Playlist',
//                       //style: TextStyle(color: Colors.grey),
//                     ),
//                     leading: Icon(Icons.playlist_remove_outlined),
//                   ),
//                   const ListTile(
//                     iconColor: Colors.grey,
//                     textColor: Colors.grey,
//                     title: Text(
//                       'Add To Playlist',
//                       //style: TextStyle(color: Colors.grey),
//                     ),
//                     leading: Icon(Icons.playlist_add),
//                   ),
//                   const ListTile(
//                     iconColor: Colors.grey,
//                     textColor: Colors.grey,
//                     title: Text('Add To Favorite'),
//                     leading: Icon(Icons.favorite_border),
//                   ),
//                   const ListTile(
//                     iconColor: Colors.grey,
//                     textColor: Colors.grey,
//                     title: Text('Share'),
//                     leading: Icon(Icons.ios_share_outlined),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             GlassContainer(
//               borderRadius: BorderRadius.circular(14),
//               blur: 5,
//               color: Colors.black54.withOpacity(0.5),
//               height: 40,
//               width: double.infinity,
//               child: Center(child: Text('Cancel')),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ]),
//         );
//       });
// }
