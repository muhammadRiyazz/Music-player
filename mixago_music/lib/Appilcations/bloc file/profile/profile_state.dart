part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required String photo,
  }) = _ProfileState;
  factory ProfileState.initial() {
    return ProfileState(photo: '');
  }
}
