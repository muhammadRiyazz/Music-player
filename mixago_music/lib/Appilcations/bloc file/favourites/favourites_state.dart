part of 'favourites_bloc.dart';

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState({
    required List<Musics> favouritelist,
  }) = _FavouritesState;

  factory FavouritesState.initial() {
 Box<List> librarybox = getlibrarybox();
    final List<Musics> favouriteSongsList =
        librarybox.get('Favourites')!.toList().cast<Musics>();

    return  FavouritesState(favouritelist:favouriteSongsList);
  }
}
