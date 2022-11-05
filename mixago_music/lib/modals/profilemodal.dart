import 'package:hive_flutter/hive_flutter.dart';
part 'profilemodal.g.dart';

@HiveType(typeId: 1)
class UserProfile extends HiveObject {
  @HiveField(5)
  final String username;

  @HiveField(6)
  final String userimage;
  UserProfile({
    required this.username,
    required this.userimage,
  });
}
