import 'package:hive_flutter/hive_flutter.dart';
part 'Musics.g.dart';

@HiveType(typeId: 0)
class Musics extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;
  @HiveField(2)
  final String artist;

  @HiveField(3)
  final String url;

  Musics(
      {required this.id,
      required this.artist,
      required this.title,
      required this.url});
}
