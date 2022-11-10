import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

part 'lyricsresponse.g.dart';

@JsonSerializable()
class Lyricsresponse {
  bool? success;
  String? requestedtitle;
  String? resolvedtitle;
  String? resolvedartist;
  String? lyrics;

  Lyricsresponse({
    this.success,
    this.requestedtitle,
    this.resolvedtitle,
    this.resolvedartist,
    this.lyrics,
  });

  factory Lyricsresponse.fromJson(Map<String, dynamic> json) {
    log('modallyric');
    return _$LyricsresponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LyricsresponseToJson(this);
}
