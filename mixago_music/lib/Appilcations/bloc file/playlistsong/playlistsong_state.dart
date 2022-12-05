part of 'playlistsong_bloc.dart';

@freezed
class PlaylistsongState with _$PlaylistsongState {
  const factory PlaylistsongState({
    required List<Musics> musiclist,
  }) = _PlaylistsongState;
  factory PlaylistsongState.initial() {
    return const PlaylistsongState(musiclist: []);
  }
}
