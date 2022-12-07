import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mixago_music/modals/database_function.dart';
import 'package:mixago_music/modals/musics/Musics.dart';

part 'mostplay_event.dart';
part 'mostplay_state.dart';
part 'mostplay_bloc.freezed.dart';

class MostplayBloc extends Bloc<MostplayEvent, MostplayState> {
  MostplayBloc() : super(MostplayState.initioal()) {
    on<Mostplaysongchange>((event, emit) {
      Box<List> librarybox = getlibrarybox();
      List<Musics> mostsonglist =
          librarybox.get('most Played')!.toList().cast();

      emit(MostplayState(mostplayedlist: mostsonglist));
    });
  }
}
