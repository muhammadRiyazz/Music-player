part of 'loop_and_shuffle_bloc.dart';

@freezed
class LoopAndShuffleState with _$LoopAndShuffleState {
  const factory LoopAndShuffleState({
    required Widget loop,
    required Widget shuffle,
    required bool shufflebool,
    required bool loopbool,
  }) = _Initial;
  factory LoopAndShuffleState.initial() {
    return const LoopAndShuffleState(
      loop: Icon(
        Icons.repeat_outlined,
        color: Colors.grey,
      ),
      shuffle: Icon(
        Icons.shuffle,
        color: Colors.grey,
      ),
      loopbool: false,
      shufflebool: false,
    );
  }
}
