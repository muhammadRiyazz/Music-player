import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/musics/Musics.dart';
import 'package:mixago_music/modals/profile/profilemodal.dart';

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
