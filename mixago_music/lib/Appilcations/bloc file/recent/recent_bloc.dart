import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';

part 'recent_event.dart';
part 'recent_state.dart';
part 'recent_bloc.freezed.dart';

class RecentBloc extends Bloc<RecentEvent, RecentState> {
  RecentBloc() : super(RecentState.initial()) {
    on<Recentlistchanging>((event, emit) {
      Box<List> librarybox = getlibrarybox();
      List<Musics> recentsonglist =
          librarybox.get('recent Played')!.toList().cast<Musics>();

      emit(RecentState(recentsonglist: recentsonglist));
    });
  }
}
