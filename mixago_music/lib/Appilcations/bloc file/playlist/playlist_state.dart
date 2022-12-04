part of 'playlist_bloc.dart';

@freezed
class PlaylistState with _$PlaylistState {
  const factory PlaylistState({
    required List playlist,
  }) = _PlaylistState;
  factory PlaylistState.initial() {
    Box<List> playlistbox = getplaylistbox();
    List playlists = playlistbox.keys.toList();

    return PlaylistState(
      playlist: playlists,
    );
  }
}
