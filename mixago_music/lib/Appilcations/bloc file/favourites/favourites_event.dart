part of 'favourites_bloc.dart';

@freezed
class FavouritesEvent with _$FavouritesEvent {
  const factory FavouritesEvent.listchanging(
      {required String id, required BuildContext context}) = Listchanging;
  const factory FavouritesEvent.initiallist() = Initiallist;
  const factory FavouritesEvent.iconchange({
    required String id,
  }) = Iconchange;
}
