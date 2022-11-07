// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyricsresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lyricsresponse _$LyricsresponseFromJson(Map<String, dynamic> json) =>
    Lyricsresponse(
      success: json['success'] as bool?,
      requestedtitle: json['requestedtitle'] as String?,
      resolvedtitle: json['resolvedtitle'] as String?,
      resolvedartist: json['resolvedartist'] as String?,
      lyrics: json['lyrics'] as String?,
    );

Map<String, dynamic> _$LyricsresponseToJson(Lyricsresponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'requestedtitle': instance.requestedtitle,
      'resolvedtitle': instance.resolvedtitle,
      'resolvedartist': instance.resolvedartist,
      'lyrics': instance.lyrics,
    };
