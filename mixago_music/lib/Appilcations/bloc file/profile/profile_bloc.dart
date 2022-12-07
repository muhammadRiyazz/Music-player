import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mixago_music/Appilcations/bloc%20file/playlist/playlist_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<Changephoto>((event, emit) {
      log('bloc call');
      emit(ProfileState(photo: event.img));
    });
    on<Initialphoto>((event, emit) {
      emit(ProfileState(photo: event.Photo));
    });
  }
}
