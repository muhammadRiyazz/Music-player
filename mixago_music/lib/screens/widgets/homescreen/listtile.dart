import 'package:flutter/material.dart';

import '../../nowplaying.dart';
import '../bottomsheet.dart';
import '../miniplayer.dart';

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
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            //myminiplayer(context);

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const NowPlaying()),
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
            bottansheet(context);
          },
          child: Icon(
            Icons.more_vert_rounded,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    ),
  );
}
