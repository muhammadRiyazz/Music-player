import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mixago_music/modals/profilemodal.dart';

import '../modals/database_function.dart';

class profileeditpage extends StatefulWidget {
  const profileeditpage({super.key, required this.myname, required this.myimg});

  final String myname;
  final String myimg;

  @override
  State<profileeditpage> createState() => _profileeditpageState();
}

class _profileeditpageState extends State<profileeditpage> {
  TextEditingController namecontroller = TextEditingController();
  String? myimage;

  @override
  void initState() {
    namecontroller.text = widget.myname;
    myimage = widget.myimg;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // color: Colors.black,
                padding: const EdgeInsets.all(16),
                height: size.height * 0.29,
                width: size.width * 0.64,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: myimage ==
                          'asset/img/blank-profile-picture-973460_1280.webp'
                      ? Image.asset(fit: BoxFit.cover, myimage.toString())
                      : Image.file(fit: BoxFit.cover, File(myimage.toString())),
                ),
              ),
              TextButton(
                onPressed: () async {
                  myimagepicker();
                },
                child: const Text(
                  'Change Photo',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: TextField(
                  style: const TextStyle(color: Colors.grey),
                  controller: namecontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade700),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: TextButton(
                    onPressed: () {
                      save();

                      Navigator.pop(context);
                    },
                    child: const Text(
                      'SAVE',
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  myimagepicker() {
    return showModalBottomSheet(
      backgroundColor: Colors.black12.withOpacity(0),
      context: context,
      builder: (context) {
        return Container(
          color: Colors.black.withOpacity(0.0),
          height: 117,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlassContainer(
                blur: 4,
                color: const Color.fromARGB(255, 11, 11, 8).withOpacity(0.2),
                child: Column(children: [
                  GestureDetector(
                    onTap: (() {
                      addimage(source: ImageSource.camera);
                      Navigator.pop(context);
                    }),
                    child: ListTile(
                      iconColor: Colors.grey.shade500,
                      textColor: Colors.grey.shade500,
                      leading: const Icon(Icons.camera_alt_outlined),
                      title: const Text('Camara'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      addimage(source: ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      iconColor: Colors.grey.shade500,
                      textColor: Colors.grey.shade500,
                      leading: const Icon(Icons.photo),
                      title: const Text('Galarry'),
                    ),
                  )
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

  addimage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file == null) {
      return null;
    }
    setState(() {
      myimage = file.path;
    });

    log(myimage.toString());
  }

  save() {
    log('save');
    final photo = myimage;
    String name = namecontroller.text.trim();
    if (photo == null || name == null) {
      return;
    }
    final profiledatabase = UserProfile(
        userimage: photo.toString(),
        username: name.isEmpty ? widget.myname : name);

    final userdata = getprofilebox();

    userdata.put('user', profiledatabase);
    log('save');
    log(userdata.length.toString());
  }
}
