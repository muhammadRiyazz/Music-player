import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixago_music/modals/Musics.dart';
import 'package:mixago_music/modals/database_function.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial()) {
    on<Search>((event, emit) {
      final Box<Musics> musicsBox = getsongsmodalbox();
      final List<Musics> allsongs = musicsBox.values.toList();
      late List<Musics> searchmusic;

      searchmusic = allsongs
          .where((element) => element.title
              .toLowerCase()
              .contains(event.searchtext.toLowerCase()))
          .toList();

      emit(SearchState(
        songlist: searchmusic,
        // textfieldbool: true,
        // librarybool: false,
      ));
    });

    on<Visiblesearch>((event, emit) {});
  }
}
