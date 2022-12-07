part of 'searchbutton_bloc.dart';

@freezed
class SearchbuttonState with _$SearchbuttonState {
  const factory SearchbuttonState({
    required bool textfieldbool,
    required bool librarybool,
  }) = _SearchbuttonState;
  factory SearchbuttonState.initial() {
    return SearchbuttonState(textfieldbool: false, librarybool: true);
  }
}
