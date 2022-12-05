// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loop_and_shuffle_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoopAndShuffleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loopbool, AssetsAudioPlayer mymusicplayer)
        loop,
    required TResult Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)
        shuffle,
    required TResult Function(bool loopbool) initialloop,
    required TResult Function(bool shufflebool) initialshuffle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loopbool, AssetsAudioPlayer mymusicplayer)? loop,
    TResult? Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)?
        shuffle,
    TResult? Function(bool loopbool)? initialloop,
    TResult? Function(bool shufflebool)? initialshuffle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loopbool, AssetsAudioPlayer mymusicplayer)? loop,
    TResult Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)?
        shuffle,
    TResult Function(bool loopbool)? initialloop,
    TResult Function(bool shufflebool)? initialshuffle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loop value) loop,
    required TResult Function(Shuffle value) shuffle,
    required TResult Function(Initialloop value) initialloop,
    required TResult Function(Initialshuffle value) initialshuffle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loop value)? loop,
    TResult? Function(Shuffle value)? shuffle,
    TResult? Function(Initialloop value)? initialloop,
    TResult? Function(Initialshuffle value)? initialshuffle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loop value)? loop,
    TResult Function(Shuffle value)? shuffle,
    TResult Function(Initialloop value)? initialloop,
    TResult Function(Initialshuffle value)? initialshuffle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoopAndShuffleEventCopyWith<$Res> {
  factory $LoopAndShuffleEventCopyWith(
          LoopAndShuffleEvent value, $Res Function(LoopAndShuffleEvent) then) =
      _$LoopAndShuffleEventCopyWithImpl<$Res, LoopAndShuffleEvent>;
}

/// @nodoc
class _$LoopAndShuffleEventCopyWithImpl<$Res, $Val extends LoopAndShuffleEvent>
    implements $LoopAndShuffleEventCopyWith<$Res> {
  _$LoopAndShuffleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoopCopyWith<$Res> {
  factory _$$LoopCopyWith(_$Loop value, $Res Function(_$Loop) then) =
      __$$LoopCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loopbool, AssetsAudioPlayer mymusicplayer});
}

/// @nodoc
class __$$LoopCopyWithImpl<$Res>
    extends _$LoopAndShuffleEventCopyWithImpl<$Res, _$Loop>
    implements _$$LoopCopyWith<$Res> {
  __$$LoopCopyWithImpl(_$Loop _value, $Res Function(_$Loop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loopbool = null,
    Object? mymusicplayer = null,
  }) {
    return _then(_$Loop(
      loopbool: null == loopbool
          ? _value.loopbool
          : loopbool // ignore: cast_nullable_to_non_nullable
              as bool,
      mymusicplayer: null == mymusicplayer
          ? _value.mymusicplayer
          : mymusicplayer // ignore: cast_nullable_to_non_nullable
              as AssetsAudioPlayer,
    ));
  }
}

/// @nodoc

class _$Loop implements Loop {
  const _$Loop({required this.loopbool, required this.mymusicplayer});

  @override
  final bool loopbool;
  @override
  final AssetsAudioPlayer mymusicplayer;

  @override
  String toString() {
    return 'LoopAndShuffleEvent.loop(loopbool: $loopbool, mymusicplayer: $mymusicplayer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loop &&
            (identical(other.loopbool, loopbool) ||
                other.loopbool == loopbool) &&
            (identical(other.mymusicplayer, mymusicplayer) ||
                other.mymusicplayer == mymusicplayer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loopbool, mymusicplayer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoopCopyWith<_$Loop> get copyWith =>
      __$$LoopCopyWithImpl<_$Loop>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loopbool, AssetsAudioPlayer mymusicplayer)
        loop,
    required TResult Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)
        shuffle,
    required TResult Function(bool loopbool) initialloop,
    required TResult Function(bool shufflebool) initialshuffle,
  }) {
    return loop(loopbool, mymusicplayer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loopbool, AssetsAudioPlayer mymusicplayer)? loop,
    TResult? Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)?
        shuffle,
    TResult? Function(bool loopbool)? initialloop,
    TResult? Function(bool shufflebool)? initialshuffle,
  }) {
    return loop?.call(loopbool, mymusicplayer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loopbool, AssetsAudioPlayer mymusicplayer)? loop,
    TResult Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)?
        shuffle,
    TResult Function(bool loopbool)? initialloop,
    TResult Function(bool shufflebool)? initialshuffle,
    required TResult orElse(),
  }) {
    if (loop != null) {
      return loop(loopbool, mymusicplayer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loop value) loop,
    required TResult Function(Shuffle value) shuffle,
    required TResult Function(Initialloop value) initialloop,
    required TResult Function(Initialshuffle value) initialshuffle,
  }) {
    return loop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loop value)? loop,
    TResult? Function(Shuffle value)? shuffle,
    TResult? Function(Initialloop value)? initialloop,
    TResult? Function(Initialshuffle value)? initialshuffle,
  }) {
    return loop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loop value)? loop,
    TResult Function(Shuffle value)? shuffle,
    TResult Function(Initialloop value)? initialloop,
    TResult Function(Initialshuffle value)? initialshuffle,
    required TResult orElse(),
  }) {
    if (loop != null) {
      return loop(this);
    }
    return orElse();
  }
}

abstract class Loop implements LoopAndShuffleEvent {
  const factory Loop(
      {required final bool loopbool,
      required final AssetsAudioPlayer mymusicplayer}) = _$Loop;

  bool get loopbool;
  AssetsAudioPlayer get mymusicplayer;
  @JsonKey(ignore: true)
  _$$LoopCopyWith<_$Loop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShuffleCopyWith<$Res> {
  factory _$$ShuffleCopyWith(_$Shuffle value, $Res Function(_$Shuffle) then) =
      __$$ShuffleCopyWithImpl<$Res>;
  @useResult
  $Res call({bool shufflebool, AssetsAudioPlayer mymusicplayer});
}

/// @nodoc
class __$$ShuffleCopyWithImpl<$Res>
    extends _$LoopAndShuffleEventCopyWithImpl<$Res, _$Shuffle>
    implements _$$ShuffleCopyWith<$Res> {
  __$$ShuffleCopyWithImpl(_$Shuffle _value, $Res Function(_$Shuffle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shufflebool = null,
    Object? mymusicplayer = null,
  }) {
    return _then(_$Shuffle(
      shufflebool: null == shufflebool
          ? _value.shufflebool
          : shufflebool // ignore: cast_nullable_to_non_nullable
              as bool,
      mymusicplayer: null == mymusicplayer
          ? _value.mymusicplayer
          : mymusicplayer // ignore: cast_nullable_to_non_nullable
              as AssetsAudioPlayer,
    ));
  }
}

/// @nodoc

class _$Shuffle implements Shuffle {
  const _$Shuffle({required this.shufflebool, required this.mymusicplayer});

  @override
  final bool shufflebool;
  @override
  final AssetsAudioPlayer mymusicplayer;

  @override
  String toString() {
    return 'LoopAndShuffleEvent.shuffle(shufflebool: $shufflebool, mymusicplayer: $mymusicplayer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Shuffle &&
            (identical(other.shufflebool, shufflebool) ||
                other.shufflebool == shufflebool) &&
            (identical(other.mymusicplayer, mymusicplayer) ||
                other.mymusicplayer == mymusicplayer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shufflebool, mymusicplayer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShuffleCopyWith<_$Shuffle> get copyWith =>
      __$$ShuffleCopyWithImpl<_$Shuffle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loopbool, AssetsAudioPlayer mymusicplayer)
        loop,
    required TResult Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)
        shuffle,
    required TResult Function(bool loopbool) initialloop,
    required TResult Function(bool shufflebool) initialshuffle,
  }) {
    return shuffle(shufflebool, mymusicplayer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loopbool, AssetsAudioPlayer mymusicplayer)? loop,
    TResult? Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)?
        shuffle,
    TResult? Function(bool loopbool)? initialloop,
    TResult? Function(bool shufflebool)? initialshuffle,
  }) {
    return shuffle?.call(shufflebool, mymusicplayer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loopbool, AssetsAudioPlayer mymusicplayer)? loop,
    TResult Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)?
        shuffle,
    TResult Function(bool loopbool)? initialloop,
    TResult Function(bool shufflebool)? initialshuffle,
    required TResult orElse(),
  }) {
    if (shuffle != null) {
      return shuffle(shufflebool, mymusicplayer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loop value) loop,
    required TResult Function(Shuffle value) shuffle,
    required TResult Function(Initialloop value) initialloop,
    required TResult Function(Initialshuffle value) initialshuffle,
  }) {
    return shuffle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loop value)? loop,
    TResult? Function(Shuffle value)? shuffle,
    TResult? Function(Initialloop value)? initialloop,
    TResult? Function(Initialshuffle value)? initialshuffle,
  }) {
    return shuffle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loop value)? loop,
    TResult Function(Shuffle value)? shuffle,
    TResult Function(Initialloop value)? initialloop,
    TResult Function(Initialshuffle value)? initialshuffle,
    required TResult orElse(),
  }) {
    if (shuffle != null) {
      return shuffle(this);
    }
    return orElse();
  }
}

abstract class Shuffle implements LoopAndShuffleEvent {
  const factory Shuffle(
      {required final bool shufflebool,
      required final AssetsAudioPlayer mymusicplayer}) = _$Shuffle;

  bool get shufflebool;
  AssetsAudioPlayer get mymusicplayer;
  @JsonKey(ignore: true)
  _$$ShuffleCopyWith<_$Shuffle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialloopCopyWith<$Res> {
  factory _$$InitialloopCopyWith(
          _$Initialloop value, $Res Function(_$Initialloop) then) =
      __$$InitialloopCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loopbool});
}

/// @nodoc
class __$$InitialloopCopyWithImpl<$Res>
    extends _$LoopAndShuffleEventCopyWithImpl<$Res, _$Initialloop>
    implements _$$InitialloopCopyWith<$Res> {
  __$$InitialloopCopyWithImpl(
      _$Initialloop _value, $Res Function(_$Initialloop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loopbool = null,
  }) {
    return _then(_$Initialloop(
      loopbool: null == loopbool
          ? _value.loopbool
          : loopbool // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initialloop implements Initialloop {
  const _$Initialloop({required this.loopbool});

  @override
  final bool loopbool;

  @override
  String toString() {
    return 'LoopAndShuffleEvent.initialloop(loopbool: $loopbool)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initialloop &&
            (identical(other.loopbool, loopbool) ||
                other.loopbool == loopbool));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loopbool);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialloopCopyWith<_$Initialloop> get copyWith =>
      __$$InitialloopCopyWithImpl<_$Initialloop>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loopbool, AssetsAudioPlayer mymusicplayer)
        loop,
    required TResult Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)
        shuffle,
    required TResult Function(bool loopbool) initialloop,
    required TResult Function(bool shufflebool) initialshuffle,
  }) {
    return initialloop(loopbool);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loopbool, AssetsAudioPlayer mymusicplayer)? loop,
    TResult? Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)?
        shuffle,
    TResult? Function(bool loopbool)? initialloop,
    TResult? Function(bool shufflebool)? initialshuffle,
  }) {
    return initialloop?.call(loopbool);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loopbool, AssetsAudioPlayer mymusicplayer)? loop,
    TResult Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)?
        shuffle,
    TResult Function(bool loopbool)? initialloop,
    TResult Function(bool shufflebool)? initialshuffle,
    required TResult orElse(),
  }) {
    if (initialloop != null) {
      return initialloop(loopbool);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loop value) loop,
    required TResult Function(Shuffle value) shuffle,
    required TResult Function(Initialloop value) initialloop,
    required TResult Function(Initialshuffle value) initialshuffle,
  }) {
    return initialloop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loop value)? loop,
    TResult? Function(Shuffle value)? shuffle,
    TResult? Function(Initialloop value)? initialloop,
    TResult? Function(Initialshuffle value)? initialshuffle,
  }) {
    return initialloop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loop value)? loop,
    TResult Function(Shuffle value)? shuffle,
    TResult Function(Initialloop value)? initialloop,
    TResult Function(Initialshuffle value)? initialshuffle,
    required TResult orElse(),
  }) {
    if (initialloop != null) {
      return initialloop(this);
    }
    return orElse();
  }
}

abstract class Initialloop implements LoopAndShuffleEvent {
  const factory Initialloop({required final bool loopbool}) = _$Initialloop;

  bool get loopbool;
  @JsonKey(ignore: true)
  _$$InitialloopCopyWith<_$Initialloop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialshuffleCopyWith<$Res> {
  factory _$$InitialshuffleCopyWith(
          _$Initialshuffle value, $Res Function(_$Initialshuffle) then) =
      __$$InitialshuffleCopyWithImpl<$Res>;
  @useResult
  $Res call({bool shufflebool});
}

/// @nodoc
class __$$InitialshuffleCopyWithImpl<$Res>
    extends _$LoopAndShuffleEventCopyWithImpl<$Res, _$Initialshuffle>
    implements _$$InitialshuffleCopyWith<$Res> {
  __$$InitialshuffleCopyWithImpl(
      _$Initialshuffle _value, $Res Function(_$Initialshuffle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shufflebool = null,
  }) {
    return _then(_$Initialshuffle(
      shufflebool: null == shufflebool
          ? _value.shufflebool
          : shufflebool // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Initialshuffle implements Initialshuffle {
  const _$Initialshuffle({required this.shufflebool});

  @override
  final bool shufflebool;

  @override
  String toString() {
    return 'LoopAndShuffleEvent.initialshuffle(shufflebool: $shufflebool)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initialshuffle &&
            (identical(other.shufflebool, shufflebool) ||
                other.shufflebool == shufflebool));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shufflebool);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialshuffleCopyWith<_$Initialshuffle> get copyWith =>
      __$$InitialshuffleCopyWithImpl<_$Initialshuffle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loopbool, AssetsAudioPlayer mymusicplayer)
        loop,
    required TResult Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)
        shuffle,
    required TResult Function(bool loopbool) initialloop,
    required TResult Function(bool shufflebool) initialshuffle,
  }) {
    return initialshuffle(shufflebool);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loopbool, AssetsAudioPlayer mymusicplayer)? loop,
    TResult? Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)?
        shuffle,
    TResult? Function(bool loopbool)? initialloop,
    TResult? Function(bool shufflebool)? initialshuffle,
  }) {
    return initialshuffle?.call(shufflebool);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loopbool, AssetsAudioPlayer mymusicplayer)? loop,
    TResult Function(bool shufflebool, AssetsAudioPlayer mymusicplayer)?
        shuffle,
    TResult Function(bool loopbool)? initialloop,
    TResult Function(bool shufflebool)? initialshuffle,
    required TResult orElse(),
  }) {
    if (initialshuffle != null) {
      return initialshuffle(shufflebool);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loop value) loop,
    required TResult Function(Shuffle value) shuffle,
    required TResult Function(Initialloop value) initialloop,
    required TResult Function(Initialshuffle value) initialshuffle,
  }) {
    return initialshuffle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loop value)? loop,
    TResult? Function(Shuffle value)? shuffle,
    TResult? Function(Initialloop value)? initialloop,
    TResult? Function(Initialshuffle value)? initialshuffle,
  }) {
    return initialshuffle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loop value)? loop,
    TResult Function(Shuffle value)? shuffle,
    TResult Function(Initialloop value)? initialloop,
    TResult Function(Initialshuffle value)? initialshuffle,
    required TResult orElse(),
  }) {
    if (initialshuffle != null) {
      return initialshuffle(this);
    }
    return orElse();
  }
}

abstract class Initialshuffle implements LoopAndShuffleEvent {
  const factory Initialshuffle({required final bool shufflebool}) =
      _$Initialshuffle;

  bool get shufflebool;
  @JsonKey(ignore: true)
  _$$InitialshuffleCopyWith<_$Initialshuffle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoopAndShuffleState {
  Widget get loop => throw _privateConstructorUsedError;
  Widget get shuffle => throw _privateConstructorUsedError;
  bool get shufflebool => throw _privateConstructorUsedError;
  bool get loopbool => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoopAndShuffleStateCopyWith<LoopAndShuffleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoopAndShuffleStateCopyWith<$Res> {
  factory $LoopAndShuffleStateCopyWith(
          LoopAndShuffleState value, $Res Function(LoopAndShuffleState) then) =
      _$LoopAndShuffleStateCopyWithImpl<$Res, LoopAndShuffleState>;
  @useResult
  $Res call({Widget loop, Widget shuffle, bool shufflebool, bool loopbool});
}

/// @nodoc
class _$LoopAndShuffleStateCopyWithImpl<$Res, $Val extends LoopAndShuffleState>
    implements $LoopAndShuffleStateCopyWith<$Res> {
  _$LoopAndShuffleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loop = null,
    Object? shuffle = null,
    Object? shufflebool = null,
    Object? loopbool = null,
  }) {
    return _then(_value.copyWith(
      loop: null == loop
          ? _value.loop
          : loop // ignore: cast_nullable_to_non_nullable
              as Widget,
      shuffle: null == shuffle
          ? _value.shuffle
          : shuffle // ignore: cast_nullable_to_non_nullable
              as Widget,
      shufflebool: null == shufflebool
          ? _value.shufflebool
          : shufflebool // ignore: cast_nullable_to_non_nullable
              as bool,
      loopbool: null == loopbool
          ? _value.loopbool
          : loopbool // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $LoopAndShuffleStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget loop, Widget shuffle, bool shufflebool, bool loopbool});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$LoopAndShuffleStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loop = null,
    Object? shuffle = null,
    Object? shufflebool = null,
    Object? loopbool = null,
  }) {
    return _then(_$_Initial(
      loop: null == loop
          ? _value.loop
          : loop // ignore: cast_nullable_to_non_nullable
              as Widget,
      shuffle: null == shuffle
          ? _value.shuffle
          : shuffle // ignore: cast_nullable_to_non_nullable
              as Widget,
      shufflebool: null == shufflebool
          ? _value.shufflebool
          : shufflebool // ignore: cast_nullable_to_non_nullable
              as bool,
      loopbool: null == loopbool
          ? _value.loopbool
          : loopbool // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.loop,
      required this.shuffle,
      required this.shufflebool,
      required this.loopbool});

  @override
  final Widget loop;
  @override
  final Widget shuffle;
  @override
  final bool shufflebool;
  @override
  final bool loopbool;

  @override
  String toString() {
    return 'LoopAndShuffleState(loop: $loop, shuffle: $shuffle, shufflebool: $shufflebool, loopbool: $loopbool)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.loop, loop) || other.loop == loop) &&
            (identical(other.shuffle, shuffle) || other.shuffle == shuffle) &&
            (identical(other.shufflebool, shufflebool) ||
                other.shufflebool == shufflebool) &&
            (identical(other.loopbool, loopbool) ||
                other.loopbool == loopbool));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loop, shuffle, shufflebool, loopbool);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements LoopAndShuffleState {
  const factory _Initial(
      {required final Widget loop,
      required final Widget shuffle,
      required final bool shufflebool,
      required final bool loopbool}) = _$_Initial;

  @override
  Widget get loop;
  @override
  Widget get shuffle;
  @override
  bool get shufflebool;
  @override
  bool get loopbool;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
