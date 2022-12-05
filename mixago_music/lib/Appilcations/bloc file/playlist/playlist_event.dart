part of 'playlist_bloc.dart';

@freezed
class PlaylistEvent with _$PlaylistEvent {
  const factory PlaylistEvent.initialplaylists() = Initialplaylists;
  const factory PlaylistEvent.createplaylists(
      {required TextEditingController textcntrol}) = Createplaylists;
  const factory PlaylistEvent.renameplaylists(
      {required TextEditingController textcntrol,
      required String key}) = Renameplaylists;
  const factory PlaylistEvent.deleteplaylists({required String key}) =
      Deleteplaylists;
}
