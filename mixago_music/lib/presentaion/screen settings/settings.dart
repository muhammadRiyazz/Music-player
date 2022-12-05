// ignore_for_file: prefer_const_constructors

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mixago_music/presentaion/screen%20settings/page_licenses/licenses.dart';
import 'package:mixago_music/presentaion/screen%20settings/page_privecy_policy/privecy_policy.dart';
import 'package:mixago_music/presentaion/screen%20settings/page_terms_conditions/tems_conditions.dart';
import 'package:mixago_music/presentaion/screen%20splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AssetsAudioPlayer myaudioplayer = AssetsAudioPlayer.withId('0');

  Future getnotification({required bool swichvalue}) async {
    setState(() {
      notificationvalue = swichvalue;
      notificationvalue!
          ? myaudioplayer.showNotification = true
          : myaudioplayer.showNotification = false;
    });
    final mySharedPreferences = await SharedPreferences.getInstance();
    await mySharedPreferences.setBool('notification', notificationvalue!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey.shade300),
        backgroundColor: Colors.black,
        title: Text(
          'Settings'.toUpperCase(),
          style: TextStyle(color: Colors.grey.shade300),
        ),
      ),
      //backgroundColor: Colors.black,
      body: Container(
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

        padding: const EdgeInsets.all(10),
        //color: Colors.black,
        child: Column(
          children: [
            myListTile(
              onpress: () {},
              text: 'Notification',
              firstmyicon: const Icon(Icons.notifications_active_outlined),
              lastmyicon: Switch(
                activeTrackColor: const Color.fromARGB(255, 158, 158, 158),
                inactiveTrackColor: Colors.grey,
                value: notificationvalue!,
                onChanged: (value) async {
                  await getnotification(swichvalue: value);
                },
              ),
            ),
            myListTile(
                onpress: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PrivecyPolicy();
                    },
                  ));
                },
                text: 'Privecy & Policy',
                firstmyicon: const Icon(Icons.policy_outlined),
                lastmyicon: const Icon(Icons.navigate_next_outlined)),
            myListTile(
                onpress: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return TermsCoundition();
                    },
                  ));
                },
                text: 'Terms & Counditions',
                firstmyicon: const Icon(Icons.mark_unread_chat_alt_rounded),
                lastmyicon: const Icon(Icons.navigate_next_outlined)),
            myListTile(
              onpress: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return licenses();
                  },
                ));
              },
              text: 'Licenses',
              firstmyicon: const Icon(Icons.privacy_tip_sharp),
              lastmyicon: const Icon(Icons.navigate_next_outlined),
            ),
          ],
        ),
      ),
    );
  }

  myListTile(
      {required String text,
      required Widget firstmyicon,
      lastmyicon,
      required onpress}) {
    return ListTile(
      onTap: onpress,
      iconColor: Colors.grey,
      trailing: lastmyicon,
      leading: firstmyicon,
      title: Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
