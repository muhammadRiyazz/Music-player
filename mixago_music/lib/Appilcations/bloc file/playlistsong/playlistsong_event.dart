part of 'playlistsong_bloc.dart';

@freezed
class PlaylistsongEvent with _$PlaylistsongEvent {
  const factory PlaylistsongEvent.songadd(
      {required String id,
      required String listkey,
      required BuildContext context}) = Songadd;
  const factory PlaylistsongEvent.blocsongremove(
      {required String id,
      required String listkey,
      required BuildContext context}) = blocsongremove;
  const factory PlaylistsongEvent.initialsonglist({required String listkey}) =
      Initialsonglist;
}
