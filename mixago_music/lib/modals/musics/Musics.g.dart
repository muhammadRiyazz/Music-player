// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Musics.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicsAdapter extends TypeAdapter<Musics> {
  @override
  final int typeId = 0;

  @override
  Musics read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Musics(
      id: fields[0] as String,
      artist: fields[2] as String,
      title: fields[1] as String,
      url: fields[3] as String,
      count: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Musics obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
