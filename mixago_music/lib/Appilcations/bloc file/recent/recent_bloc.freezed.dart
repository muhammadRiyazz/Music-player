// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recentlistchanging,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recentlistchanging,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recentlistchanging,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Recentlistchanging value) recentlistchanging,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Recentlistchanging value)? recentlistchanging,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Recentlistchanging value)? recentlistchanging,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentEventCopyWith<$Res> {
  factory $RecentEventCopyWith(
          RecentEvent value, $Res Function(RecentEvent) then) =
      _$RecentEventCopyWithImpl<$Res, RecentEvent>;
}

/// @nodoc
class _$RecentEventCopyWithImpl<$Res, $Val extends RecentEvent>
    implements $RecentEventCopyWith<$Res> {
  _$RecentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RecentlistchangingCopyWith<$Res> {
  factory _$$RecentlistchangingCopyWith(_$Recentlistchanging value,
          $Res Function(_$Recentlistchanging) then) =
      __$$RecentlistchangingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecentlistchangingCopyWithImpl<$Res>
    extends _$RecentEventCopyWithImpl<$Res, _$Recentlistchanging>
    implements _$$RecentlistchangingCopyWith<$Res> {
  __$$RecentlistchangingCopyWithImpl(
      _$Recentlistchanging _value, $Res Function(_$Recentlistchanging) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Recentlistchanging implements Recentlistchanging {
  const _$Recentlistchanging();

  @override
  String toString() {
    return 'RecentEvent.recentlistchanging()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Recentlistchanging);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() recentlistchanging,
  }) {
    return recentlistchanging();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? recentlistchanging,
  }) {
    return recentlistchanging?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? recentlistchanging,
    required TResult orElse(),
  }) {
    if (recentlistchanging != null) {
      return recentlistchanging();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Recentlistchanging value) recentlistchanging,
  }) {
    return recentlistchanging(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Recentlistchanging value)? recentlistchanging,
  }) {
    return recentlistchanging?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Recentlistchanging value)? recentlistchanging,
    required TResult orElse(),
  }) {
    if (recentlistchanging != null) {
      return recentlistchanging(this);
    }
    return orElse();
  }
}

abstract class Recentlistchanging implements RecentEvent {
  const factory Recentlistchanging() = _$Recentlistchanging;
}

/// @nodoc
mixin _$RecentState {
  List<Musics> get recentsonglist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentStateCopyWith<RecentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentStateCopyWith<$Res> {
  factory $RecentStateCopyWith(
          RecentState value, $Res Function(RecentState) then) =
      _$RecentStateCopyWithImpl<$Res, RecentState>;
  @useResult
  $Res call({List<Musics> recentsonglist});
}

/// @nodoc
class _$RecentStateCopyWithImpl<$Res, $Val extends RecentState>
    implements $RecentStateCopyWith<$Res> {
  _$RecentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentsonglist = null,
  }) {
    return _then(_value.copyWith(
      recentsonglist: null == recentsonglist
          ? _value.recentsonglist
          : recentsonglist // ignore: cast_nullable_to_non_nullable
              as List<Musics>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecentStateCopyWith<$Res>
    implements $RecentStateCopyWith<$Res> {
  factory _$$_RecentStateCopyWith(
          _$_RecentState value, $Res Function(_$_RecentState) then) =
      __$$_RecentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Musics> recentsonglist});
}

/// @nodoc
class __$$_RecentStateCopyWithImpl<$Res>
    extends _$RecentStateCopyWithImpl<$Res, _$_RecentState>
    implements _$$_RecentStateCopyWith<$Res> {
  __$$_RecentStateCopyWithImpl(
      _$_RecentState _value, $Res Function(_$_RecentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentsonglist = null,
  }) {
    return _then(_$_RecentState(
      recentsonglist: null == recentsonglist
          ? _value._recentsonglist
          : recentsonglist // ignore: cast_nullable_to_non_nullable
              as List<Musics>,
    ));
  }
}

/// @nodoc

class _$_RecentState implements _RecentState {
  const _$_RecentState({required final List<Musics> recentsonglist})
      : _recentsonglist = recentsonglist;

  final List<Musics> _recentsonglist;
  @override
  List<Musics> get recentsonglist {
    if (_recentsonglist is EqualUnmodifiableListView) return _recentsonglist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentsonglist);
  }

  @override
  String toString() {
    return 'RecentState(recentsonglist: $recentsonglist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentState &&
            const DeepCollectionEquality()
                .equals(other._recentsonglist, _recentsonglist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recentsonglist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentStateCopyWith<_$_RecentState> get copyWith =>
      __$$_RecentStateCopyWithImpl<_$_RecentState>(this, _$identity);
}

abstract class _RecentState implements RecentState {
  const factory _RecentState({required final List<Musics> recentsonglist}) =
      _$_RecentState;

  @override
  List<Musics> get recentsonglist;
  @override
  @JsonKey(ignore: true)
  _$$_RecentStateCopyWith<_$_RecentState> get copyWith =>
      throw _privateConstructorUsedError;
}
