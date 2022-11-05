import 'package:flutter/material.dart';

library(
    {required String libraryname,
    required BuildContext context,
    required onpress,
    required String songcount}) {
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
        width: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 10, bottom: 3),
                child: SizedBox(
                  width: 125,
                  child: Text(
                    libraryname,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.044,
                        color: Colors.grey.shade500),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8),
              //   child: Text(
              //     '${songcount} SONGS',
              //     style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              //   ),
              // )
            ]),
          ],
        ),
      ),
    ),
  );
}
