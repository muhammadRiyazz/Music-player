import 'package:flutter/material.dart';

class Library extends StatelessWidget {
  const Library({
    Key? key,
    required this.context,
    required this.libraryname,
    required this.onpress,
    required this.songcount,
  }) : super(key: key);

  final String libraryname;
  final BuildContext context;
  final String songcount;
  final Function() onpress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onpress,
        child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 30, 24, 26),
                  Color.fromARGB(243, 19, 8, 32)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.2, 0.8],
                tileMode: TileMode.repeated,
              ),
              //  color: Colors.amber,
              borderRadius: BorderRadius.circular(6)),
          width: size.width * 0.47,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 10, bottom: 3),
                  child: SizedBox(
                    width: size.width * 0.37,
                    child: Text(
                      libraryname,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey.shade500),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
