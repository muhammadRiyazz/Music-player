import 'package:flutter/material.dart';
import 'package:mixago_music/presentaion/screen%20playlist/playlistpage.dart';

class PlayListContainer extends StatelessWidget {
  const PlayListContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const plalistpage();
          }));
        },
        child: Center(
          child: Container(
            height: size.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 26, 12, 38),
                  Color.fromARGB(255, 47, 43, 43)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.2, 0.8],
                tileMode: TileMode.repeated,
              ),
            ),
            child: Center(
                child: Text(
              'PLAYLIST',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
