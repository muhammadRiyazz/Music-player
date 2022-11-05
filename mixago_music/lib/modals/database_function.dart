import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/profilemodal.dart';
import 'package:on_audio_query/on_audio_query.dart';

Box<Musics> getsongsmodalbox() {
  return Hive.box<Musics>('musics');
}

Box<List> getlibrarybox() {
  return Hive.box<List>('Library');
}

Box<List> getplaylistbox() {
  return Hive.box<List>('playlist');
}

Box<UserProfile> getprofilebox() {
  return Hive.box<UserProfile>('profile');
}
