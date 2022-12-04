// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaylistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playlists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playlists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playlists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Playlists value) playlists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Playlists value)? playlists,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Playlists value)? playlists,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistEventCopyWith<$Res> {
  factory $PlaylistEventCopyWith(
          PlaylistEvent value, $Res Function(PlaylistEvent) then) =
      _$PlaylistEventCopyWithImpl<$Res, PlaylistEvent>;
}

/// @nodoc
class _$PlaylistEventCopyWithImpl<$Res, $Val extends PlaylistEvent>
    implements $PlaylistEventCopyWith<$Res> {
  _$PlaylistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlaylistsCopyWith<$Res> {
  factory _$$PlaylistsCopyWith(
          _$Playlists value, $Res Function(_$Playlists) then) =
      __$$PlaylistsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlaylistsCopyWithImpl<$Res>
    extends _$PlaylistEventCopyWithImpl<$Res, _$Playlists>
    implements _$$PlaylistsCopyWith<$Res> {
  __$$PlaylistsCopyWithImpl(
      _$Playlists _value, $Res Function(_$Playlists) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Playlists implements Playlists {
  const _$Playlists();

  @override
  String toString() {
    return 'PlaylistEvent.playlists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Playlists);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() playlists,
  }) {
    return playlists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? playlists,
  }) {
    return playlists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? playlists,
    required TResult orElse(),
  }) {
    if (playlists != null) {
      return playlists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Playlists value) playlists,
  }) {
    return playlists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Playlists value)? playlists,
  }) {
    return playlists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Playlists value)? playlists,
    required TResult orElse(),
  }) {
    if (playlists != null) {
      return playlists(this);
    }
    return orElse();
  }
}

abstract class Playlists implements PlaylistEvent {
  const factory Playlists() = _$Playlists;
}

/// @nodoc
mixin _$PlaylistState {
  List<dynamic> get playlist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistStateCopyWith<PlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistStateCopyWith<$Res> {
  factory $PlaylistStateCopyWith(
          PlaylistState value, $Res Function(PlaylistState) then) =
      _$PlaylistStateCopyWithImpl<$Res, PlaylistState>;
  @useResult
  $Res call({List<dynamic> playlist});
}

/// @nodoc
class _$PlaylistStateCopyWithImpl<$Res, $Val extends PlaylistState>
    implements $PlaylistStateCopyWith<$Res> {
  _$PlaylistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlist = null,
  }) {
    return _then(_value.copyWith(
      playlist: null == playlist
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaylistStateCopyWith<$Res>
    implements $PlaylistStateCopyWith<$Res> {
  factory _$$_PlaylistStateCopyWith(
          _$_PlaylistState value, $Res Function(_$_PlaylistState) then) =
      __$$_PlaylistStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> playlist});
}

/// @nodoc
class __$$_PlaylistStateCopyWithImpl<$Res>
    extends _$PlaylistStateCopyWithImpl<$Res, _$_PlaylistState>
    implements _$$_PlaylistStateCopyWith<$Res> {
  __$$_PlaylistStateCopyWithImpl(
      _$_PlaylistState _value, $Res Function(_$_PlaylistState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlist = null,
  }) {
    return _then(_$_PlaylistState(
      playlist: null == playlist
          ? _value._playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_PlaylistState implements _PlaylistState {
  const _$_PlaylistState({required final List<dynamic> playlist})
      : _playlist = playlist;

  final List<dynamic> _playlist;
  @override
  List<dynamic> get playlist {
    if (_playlist is EqualUnmodifiableListView) return _playlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlist);
  }

  @override
  String toString() {
    return 'PlaylistState(playlist: $playlist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistState &&
            const DeepCollectionEquality().equals(other._playlist, _playlist));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_playlist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaylistStateCopyWith<_$_PlaylistState> get copyWith =>
      __$$_PlaylistStateCopyWithImpl<_$_PlaylistState>(this, _$identity);
}

abstract class _PlaylistState implements PlaylistState {
  const factory _PlaylistState({required final List<dynamic> playlist}) =
      _$_PlaylistState;

  @override
  List<dynamic> get playlist;
  @override
  @JsonKey(ignore: true)
  _$$_PlaylistStateCopyWith<_$_PlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}
