import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loop_and_shuffle_event.dart';
part 'loop_and_shuffle_state.dart';
part 'loop_and_shuffle_bloc.freezed.dart';

class LoopAndShuffleBloc
    extends Bloc<LoopAndShuffleEvent, LoopAndShuffleState> {
  LoopAndShuffleBloc() : super(LoopAndShuffleState.initial()) {
    on<Loop>((event, emit) {
      if (event.loopbool == true) {
        log('true');
        const Widget newloop = Icon(
          Icons.repeat,
          color: Colors.red,
        );
        event.mymusicplayer.toggleLoop();

        emit(LoopAndShuffleState(
            loop: newloop,
            shuffle: state.shuffle,
            loopbool: false,
            shufflebool: state.shufflebool));
      } else if (event.loopbool == false) {
        log('false');

        const Widget newloop = Icon(
          Icons.repeat,
          color: Colors.grey,
        );
        event.mymusicplayer.toggleLoop();
        emit(LoopAndShuffleState(
            loop: newloop,
            shuffle: state.shuffle,
            loopbool: true,
            shufflebool: state.shufflebool));
      }
    });
    on<Shuffle>((event, emit) {
      if (event.shufflebool == true) {
        log('true');
        const Widget newshuffle = Icon(
          Icons.shuffle,
          color: Colors.red,
        );
        event.mymusicplayer.toggleShuffle();

        emit(LoopAndShuffleState(
            loop: state.loop,
            shuffle: newshuffle,
            shufflebool: false,
            loopbool: state.loopbool));
      } else if (event.shufflebool == false) {
        log('false');
        const Widget newshuffle = Icon(
          Icons.shuffle,
          color: Colors.grey,
        );
        event.mymusicplayer.toggleShuffle();

        emit(LoopAndShuffleState(
            loop: state.loop,
            shuffle: newshuffle,
            loopbool: state.loopbool,
            shufflebool: true));
      }
    });
  }
}
