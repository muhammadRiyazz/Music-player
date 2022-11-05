import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Size mysize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.black,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      //backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
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

        padding: EdgeInsets.all(10),
        //color: Colors.black,
        child: Column(
          children: [
            myListTile(
              text: 'Notification',
              firstmyicon: Icon(Icons.notifications_active_outlined),
              lastmyicon: Switch(
                activeTrackColor: Colors.grey,
                inactiveTrackColor: Colors.grey,
                value: true,
                onChanged: (value) {},
              ),
            ),
            myListTile(
                text: 'Privecy & Policy',
                firstmyicon: Icon(Icons.privacy_tip_outlined),
                lastmyicon: Icon(Icons.navigate_next_outlined)),
            myListTile(
                text: 'Temrs & Coundition',
                firstmyicon: Icon(Icons.mark_unread_chat_alt_rounded),
                lastmyicon: Icon(Icons.navigate_next_outlined)),
            myListTile(
                text: 'Resset App',
                firstmyicon: Icon(Icons.restore_outlined),
                lastmyicon: SizedBox()),
          ],
        ),
      ),
    );
  }

  myListTile({required String text, required Widget firstmyicon, lastmyicon}) {
    return ListTile(
      iconColor: Colors.grey,
      trailing: lastmyicon,
      leading: firstmyicon,
      title: Text(
        text,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
