import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

playlistsbottansheet(BuildContext context) {
  var isEditing = false;
  final size = MediaQuery.of(context).size;
  return showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Color.fromARGB(0, 223, 157, 157),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: ((context, setState) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GlassContainer(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              blur: 1,
              //color: Colors.black54.withOpacity(0.1),
              // padding: EdgeInsets.symmetric(horizontal: 20),
              // decoration: const BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(30),
              //     topRight: Radius.circular(30),
              //   ),
              //   color: Colors.white,
              // ),
              // height: size.height * 0.50,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 25, right: 5, left: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel')),
                            Container(
                              // color: Colors.black,
                              padding: EdgeInsets.all(16),
                              height: size.height * 0.21,
                              width: size.width * 0.54,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    fit: BoxFit.cover, 'asset/img/music.jpg'),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Save')),
                          ],
                        ),
                      ),
                      isEditing ? renametextfeald() : playlistname(),
                      Padding(
                        padding: const EdgeInsets.all(17),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    if (isEditing == true) {
                                      isEditing = false;
                                    } else {
                                      isEditing = true;
                                    }
                                  },
                                );
                              },
                              child: const ListTile(
                                title: Text(
                                  'Rename',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                leading: Icon(
                                    Icons.drive_file_rename_outline_rounded,
                                    color: Colors.grey),
                              ),
                            ),
                            const ListTile(
                              title: Text(
                                'Delete Play List',
                                style: TextStyle(color: Colors.grey),
                              ),
                              leading: Icon(Icons.delete_sweep_outlined,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
      });
}

Widget playlistname() {
  return Text(
    'Play List Name',
    style: TextStyle(
        fontWeight: FontWeight.bold, color: Colors.grey.shade500, fontSize: 16),
  );
}

Widget renametextfeald() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: TextField(
      style: TextStyle(color: Colors.grey.shade600),
      decoration: InputDecoration(
        //focusColor: Colors.blue,

        fillColor: Colors.grey.shade800.withOpacity(0.5),
        filled: true,
        prefixIcon:
            Icon(color: Colors.grey.shade100, Icons.drive_file_rename_outline),
      ),
    ),
  );
}
