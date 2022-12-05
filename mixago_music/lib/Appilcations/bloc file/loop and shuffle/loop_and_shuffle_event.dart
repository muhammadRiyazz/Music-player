part of 'loop_and_shuffle_bloc.dart';

@freezed
class LoopAndShuffleEvent with _$LoopAndShuffleEvent {
  const factory LoopAndShuffleEvent.loop(
      {required bool loopbool,
      required AssetsAudioPlayer mymusicplayer}) = Loop;
  const factory LoopAndShuffleEvent.shuffle(
      {required bool shufflebool,
      required AssetsAudioPlayer mymusicplayer}) = Shuffle;
  const factory LoopAndShuffleEvent.initialloop({
    required bool loopbool,
  }) = Initialloop;
  const factory LoopAndShuffleEvent.initialshuffle({
    required bool shufflebool,
  }) = Initialshuffle;
}
