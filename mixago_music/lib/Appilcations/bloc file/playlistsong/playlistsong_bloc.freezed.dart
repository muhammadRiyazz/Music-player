// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlistsong_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaylistsongEvent {
  String get listkey => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String listkey, BuildContext context)
        songadd,
    required TResult Function(String id, String listkey, BuildContext context)
        blocsongremove,
    required TResult Function(String listkey) initialsonglist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String listkey, BuildContext context)? songadd,
    TResult? Function(String id, String listkey, BuildContext context)?
        blocsongremove,
    TResult? Function(String listkey)? initialsonglist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String listkey, BuildContext context)? songadd,
    TResult Function(String id, String listkey, BuildContext context)?
        blocsongremove,
    TResult Function(String listkey)? initialsonglist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Songadd value) songadd,
    required TResult Function(blocsongremove value) blocsongremove,
    required TResult Function(Initialsonglist value) initialsonglist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Songadd value)? songadd,
    TResult? Function(blocsongremove value)? blocsongremove,
    TResult? Function(Initialsonglist value)? initialsonglist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Songadd value)? songadd,
    TResult Function(blocsongremove value)? blocsongremove,
    TResult Function(Initialsonglist value)? initialsonglist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistsongEventCopyWith<PlaylistsongEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistsongEventCopyWith<$Res> {
  factory $PlaylistsongEventCopyWith(
          PlaylistsongEvent value, $Res Function(PlaylistsongEvent) then) =
      _$PlaylistsongEventCopyWithImpl<$Res, PlaylistsongEvent>;
  @useResult
  $Res call({String listkey});
}

/// @nodoc
class _$PlaylistsongEventCopyWithImpl<$Res, $Val extends PlaylistsongEvent>
    implements $PlaylistsongEventCopyWith<$Res> {
  _$PlaylistsongEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listkey = null,
  }) {
    return _then(_value.copyWith(
      listkey: null == listkey
          ? _value.listkey
          : listkey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongaddCopyWith<$Res>
    implements $PlaylistsongEventCopyWith<$Res> {
  factory _$$SongaddCopyWith(_$Songadd value, $Res Function(_$Songadd) then) =
      __$$SongaddCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String listkey, BuildContext context});
}

/// @nodoc
class __$$SongaddCopyWithImpl<$Res>
    extends _$PlaylistsongEventCopyWithImpl<$Res, _$Songadd>
    implements _$$SongaddCopyWith<$Res> {
  __$$SongaddCopyWithImpl(_$Songadd _value, $Res Function(_$Songadd) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? listkey = null,
    Object? context = null,
  }) {
    return _then(_$Songadd(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      listkey: null == listkey
          ? _value.listkey
          : listkey // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$Songadd implements Songadd {
  const _$Songadd(
      {required this.id, required this.listkey, required this.context});

  @override
  final String id;
  @override
  final String listkey;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'PlaylistsongEvent.songadd(id: $id, listkey: $listkey, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Songadd &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.listkey, listkey) || other.listkey == listkey) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, listkey, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongaddCopyWith<_$Songadd> get copyWith =>
      __$$SongaddCopyWithImpl<_$Songadd>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String listkey, BuildContext context)
        songadd,
    required TResult Function(String id, String listkey, BuildContext context)
        blocsongremove,
    required TResult Function(String listkey) initialsonglist,
  }) {
    return songadd(id, listkey, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String listkey, BuildContext context)? songadd,
    TResult? Function(String id, String listkey, BuildContext context)?
        blocsongremove,
    TResult? Function(String listkey)? initialsonglist,
  }) {
    return songadd?.call(id, listkey, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String listkey, BuildContext context)? songadd,
    TResult Function(String id, String listkey, BuildContext context)?
        blocsongremove,
    TResult Function(String listkey)? initialsonglist,
    required TResult orElse(),
  }) {
    if (songadd != null) {
      return songadd(id, listkey, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Songadd value) songadd,
    required TResult Function(blocsongremove value) blocsongremove,
    required TResult Function(Initialsonglist value) initialsonglist,
  }) {
    return songadd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Songadd value)? songadd,
    TResult? Function(blocsongremove value)? blocsongremove,
    TResult? Function(Initialsonglist value)? initialsonglist,
  }) {
    return songadd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Songadd value)? songadd,
    TResult Function(blocsongremove value)? blocsongremove,
    TResult Function(Initialsonglist value)? initialsonglist,
    required TResult orElse(),
  }) {
    if (songadd != null) {
      return songadd(this);
    }
    return orElse();
  }
}

abstract class Songadd implements PlaylistsongEvent {
  const factory Songadd(
      {required final String id,
      required final String listkey,
      required final BuildContext context}) = _$Songadd;

  String get id;
  @override
  String get listkey;
  BuildContext get context;
  @override
  @JsonKey(ignore: true)
  _$$SongaddCopyWith<_$Songadd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$blocsongremoveCopyWith<$Res>
    implements $PlaylistsongEventCopyWith<$Res> {
  factory _$$blocsongremoveCopyWith(
          _$blocsongremove value, $Res Function(_$blocsongremove) then) =
      __$$blocsongremoveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String listkey, BuildContext context});
}

/// @nodoc
class __$$blocsongremoveCopyWithImpl<$Res>
    extends _$PlaylistsongEventCopyWithImpl<$Res, _$blocsongremove>
    implements _$$blocsongremoveCopyWith<$Res> {
  __$$blocsongremoveCopyWithImpl(
      _$blocsongremove _value, $Res Function(_$blocsongremove) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? listkey = null,
    Object? context = null,
  }) {
    return _then(_$blocsongremove(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      listkey: null == listkey
          ? _value.listkey
          : listkey // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$blocsongremove implements blocsongremove {
  const _$blocsongremove(
      {required this.id, required this.listkey, required this.context});

  @override
  final String id;
  @override
  final String listkey;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'PlaylistsongEvent.blocsongremove(id: $id, listkey: $listkey, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$blocsongremove &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.listkey, listkey) || other.listkey == listkey) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, listkey, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$blocsongremoveCopyWith<_$blocsongremove> get copyWith =>
      __$$blocsongremoveCopyWithImpl<_$blocsongremove>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String listkey, BuildContext context)
        songadd,
    required TResult Function(String id, String listkey, BuildContext context)
        blocsongremove,
    required TResult Function(String listkey) initialsonglist,
  }) {
    return blocsongremove(id, listkey, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String listkey, BuildContext context)? songadd,
    TResult? Function(String id, String listkey, BuildContext context)?
        blocsongremove,
    TResult? Function(String listkey)? initialsonglist,
  }) {
    return blocsongremove?.call(id, listkey, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String listkey, BuildContext context)? songadd,
    TResult Function(String id, String listkey, BuildContext context)?
        blocsongremove,
    TResult Function(String listkey)? initialsonglist,
    required TResult orElse(),
  }) {
    if (blocsongremove != null) {
      return blocsongremove(id, listkey, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Songadd value) songadd,
    required TResult Function(blocsongremove value) blocsongremove,
    required TResult Function(Initialsonglist value) initialsonglist,
  }) {
    return blocsongremove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Songadd value)? songadd,
    TResult? Function(blocsongremove value)? blocsongremove,
    TResult? Function(Initialsonglist value)? initialsonglist,
  }) {
    return blocsongremove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Songadd value)? songadd,
    TResult Function(blocsongremove value)? blocsongremove,
    TResult Function(Initialsonglist value)? initialsonglist,
    required TResult orElse(),
  }) {
    if (blocsongremove != null) {
      return blocsongremove(this);
    }
    return orElse();
  }
}

abstract class blocsongremove implements PlaylistsongEvent {
  const factory blocsongremove(
      {required final String id,
      required final String listkey,
      required final BuildContext context}) = _$blocsongremove;

  String get id;
  @override
  String get listkey;
  BuildContext get context;
  @override
  @JsonKey(ignore: true)
  _$$blocsongremoveCopyWith<_$blocsongremove> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialsonglistCopyWith<$Res>
    implements $PlaylistsongEventCopyWith<$Res> {
  factory _$$InitialsonglistCopyWith(
          _$Initialsonglist value, $Res Function(_$Initialsonglist) then) =
      __$$InitialsonglistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String listkey});
}

/// @nodoc
class __$$InitialsonglistCopyWithImpl<$Res>
    extends _$PlaylistsongEventCopyWithImpl<$Res, _$Initialsonglist>
    implements _$$InitialsonglistCopyWith<$Res> {
  __$$InitialsonglistCopyWithImpl(
      _$Initialsonglist _value, $Res Function(_$Initialsonglist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listkey = null,
  }) {
    return _then(_$Initialsonglist(
      listkey: null == listkey
          ? _value.listkey
          : listkey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Initialsonglist implements Initialsonglist {
  const _$Initialsonglist({required this.listkey});

  @override
  final String listkey;

  @override
  String toString() {
    return 'PlaylistsongEvent.initialsonglist(listkey: $listkey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initialsonglist &&
            (identical(other.listkey, listkey) || other.listkey == listkey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, listkey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialsonglistCopyWith<_$Initialsonglist> get copyWith =>
      __$$InitialsonglistCopyWithImpl<_$Initialsonglist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String listkey, BuildContext context)
        songadd,
    required TResult Function(String id, String listkey, BuildContext context)
        blocsongremove,
    required TResult Function(String listkey) initialsonglist,
  }) {
    return initialsonglist(listkey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String listkey, BuildContext context)? songadd,
    TResult? Function(String id, String listkey, BuildContext context)?
        blocsongremove,
    TResult? Function(String listkey)? initialsonglist,
  }) {
    return initialsonglist?.call(listkey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String listkey, BuildContext context)? songadd,
    TResult Function(String id, String listkey, BuildContext context)?
        blocsongremove,
    TResult Function(String listkey)? initialsonglist,
    required TResult orElse(),
  }) {
    if (initialsonglist != null) {
      return initialsonglist(listkey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Songadd value) songadd,
    required TResult Function(blocsongremove value) blocsongremove,
    required TResult Function(Initialsonglist value) initialsonglist,
  }) {
    return initialsonglist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Songadd value)? songadd,
    TResult? Function(blocsongremove value)? blocsongremove,
    TResult? Function(Initialsonglist value)? initialsonglist,
  }) {
    return initialsonglist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Songadd value)? songadd,
    TResult Function(blocsongremove value)? blocsongremove,
    TResult Function(Initialsonglist value)? initialsonglist,
    required TResult orElse(),
  }) {
    if (initialsonglist != null) {
      return initialsonglist(this);
    }
    return orElse();
  }
}

abstract class Initialsonglist implements PlaylistsongEvent {
  const factory Initialsonglist({required final String listkey}) =
      _$Initialsonglist;

  @override
  String get listkey;
  @override
  @JsonKey(ignore: true)
  _$$InitialsonglistCopyWith<_$Initialsonglist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlaylistsongState {
  List<Musics> get musiclist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistsongStateCopyWith<PlaylistsongState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistsongStateCopyWith<$Res> {
  factory $PlaylistsongStateCopyWith(
          PlaylistsongState value, $Res Function(PlaylistsongState) then) =
      _$PlaylistsongStateCopyWithImpl<$Res, PlaylistsongState>;
  @useResult
  $Res call({List<Musics> musiclist});
}

/// @nodoc
class _$PlaylistsongStateCopyWithImpl<$Res, $Val extends PlaylistsongState>
    implements $PlaylistsongStateCopyWith<$Res> {
  _$PlaylistsongStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musiclist = null,
  }) {
    return _then(_value.copyWith(
      musiclist: null == musiclist
          ? _value.musiclist
          : musiclist // ignore: cast_nullable_to_non_nullable
              as List<Musics>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaylistsongStateCopyWith<$Res>
    implements $PlaylistsongStateCopyWith<$Res> {
  factory _$$_PlaylistsongStateCopyWith(_$_PlaylistsongState value,
          $Res Function(_$_PlaylistsongState) then) =
      __$$_PlaylistsongStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Musics> musiclist});
}

/// @nodoc
class __$$_PlaylistsongStateCopyWithImpl<$Res>
    extends _$PlaylistsongStateCopyWithImpl<$Res, _$_PlaylistsongState>
    implements _$$_PlaylistsongStateCopyWith<$Res> {
  __$$_PlaylistsongStateCopyWithImpl(
      _$_PlaylistsongState _value, $Res Function(_$_PlaylistsongState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? musiclist = null,
  }) {
    return _then(_$_PlaylistsongState(
      musiclist: null == musiclist
          ? _value._musiclist
          : musiclist // ignore: cast_nullable_to_non_nullable
              as List<Musics>,
    ));
  }
}

/// @nodoc

class _$_PlaylistsongState implements _PlaylistsongState {
  const _$_PlaylistsongState({required final List<Musics> musiclist})
      : _musiclist = musiclist;

  final List<Musics> _musiclist;
  @override
  List<Musics> get musiclist {
    if (_musiclist is EqualUnmodifiableListView) return _musiclist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_musiclist);
  }

  @override
  String toString() {
    return 'PlaylistsongState(musiclist: $musiclist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistsongState &&
            const DeepCollectionEquality()
                .equals(other._musiclist, _musiclist));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_musiclist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaylistsongStateCopyWith<_$_PlaylistsongState> get copyWith =>
      __$$_PlaylistsongStateCopyWithImpl<_$_PlaylistsongState>(
          this, _$identity);
}

abstract class _PlaylistsongState implements PlaylistsongState {
  const factory _PlaylistsongState({required final List<Musics> musiclist}) =
      _$_PlaylistsongState;

  @override
  List<Musics> get musiclist;
  @override
  @JsonKey(ignore: true)
  _$$_PlaylistsongStateCopyWith<_$_PlaylistsongState> get copyWith =>
      throw _privateConstructorUsedError;
}
