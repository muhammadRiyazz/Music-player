import 'package:flutter/material.dart';
import 'package:mixago_music/presentaion/screen%20playlist/widgets/create_bottan_sheet.dart';

class Createplaylist extends StatelessWidget {
  const Createplaylist({
    Key? key,
    required this.createplaylistcontroller,
    required this.size,
  }) : super(key: key);

  final TextEditingController createplaylistcontroller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ceateplaylistalert(
            context: context,
            createplaylistcontroller: createplaylistcontroller);
      },
      child: Center(
        child: Container(
          height: size.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
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
            'CREATE PLAYLIST',
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
