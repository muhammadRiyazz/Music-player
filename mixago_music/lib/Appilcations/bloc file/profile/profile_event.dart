part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.changephoto({
    required String img,
  }) = Changephoto;
  const factory ProfileEvent.initialphoto({
    required String Photo,
  }) = Initialphoto;
}
