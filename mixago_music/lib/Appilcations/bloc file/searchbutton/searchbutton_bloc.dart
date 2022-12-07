import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'searchbutton_event.dart';
part 'searchbutton_state.dart';
part 'searchbutton_bloc.freezed.dart';

class SearchbuttonBloc extends Bloc<SearchbuttonEvent, SearchbuttonState> {
  SearchbuttonBloc() : super(SearchbuttonState.initial()) {
    on<Changebool>((event, emit) {
      log('bloc 1');
      if (state.librarybool == true && state.textfieldbool == false) {
        emit(const SearchbuttonState(textfieldbool: true, librarybool: false));
      } else if (state.librarybool == false && state.textfieldbool == true) {
        log('bloc 2');
        emit(const SearchbuttonState(textfieldbool: false, librarybool: true));
      }
    });
  }
}
