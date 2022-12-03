// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mostplay_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MostplayEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mostplaysongchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? mostplaysongchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mostplaysongchange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Mostplaysongchange value) mostplaysongchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Mostplaysongchange value)? mostplaysongchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Mostplaysongchange value)? mostplaysongchange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MostplayEventCopyWith<$Res> {
  factory $MostplayEventCopyWith(
          MostplayEvent value, $Res Function(MostplayEvent) then) =
      _$MostplayEventCopyWithImpl<$Res, MostplayEvent>;
}

/// @nodoc
class _$MostplayEventCopyWithImpl<$Res, $Val extends MostplayEvent>
    implements $MostplayEventCopyWith<$Res> {
  _$MostplayEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MostplaysongchangeCopyWith<$Res> {
  factory _$$MostplaysongchangeCopyWith(_$Mostplaysongchange value,
          $Res Function(_$Mostplaysongchange) then) =
      __$$MostplaysongchangeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MostplaysongchangeCopyWithImpl<$Res>
    extends _$MostplayEventCopyWithImpl<$Res, _$Mostplaysongchange>
    implements _$$MostplaysongchangeCopyWith<$Res> {
  __$$MostplaysongchangeCopyWithImpl(
      _$Mostplaysongchange _value, $Res Function(_$Mostplaysongchange) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Mostplaysongchange implements Mostplaysongchange {
  const _$Mostplaysongchange();

  @override
  String toString() {
    return 'MostplayEvent.mostplaysongchange()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Mostplaysongchange);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mostplaysongchange,
  }) {
    return mostplaysongchange();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? mostplaysongchange,
  }) {
    return mostplaysongchange?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mostplaysongchange,
    required TResult orElse(),
  }) {
    if (mostplaysongchange != null) {
      return mostplaysongchange();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Mostplaysongchange value) mostplaysongchange,
  }) {
    return mostplaysongchange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Mostplaysongchange value)? mostplaysongchange,
  }) {
    return mostplaysongchange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Mostplaysongchange value)? mostplaysongchange,
    required TResult orElse(),
  }) {
    if (mostplaysongchange != null) {
      return mostplaysongchange(this);
    }
    return orElse();
  }
}

abstract class Mostplaysongchange implements MostplayEvent {
  const factory Mostplaysongchange() = _$Mostplaysongchange;
}

/// @nodoc
mixin _$MostplayState {
  List<Musics> get mostplayedlist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MostplayStateCopyWith<MostplayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MostplayStateCopyWith<$Res> {
  factory $MostplayStateCopyWith(
          MostplayState value, $Res Function(MostplayState) then) =
      _$MostplayStateCopyWithImpl<$Res, MostplayState>;
  @useResult
  $Res call({List<Musics> mostplayedlist});
}

/// @nodoc
class _$MostplayStateCopyWithImpl<$Res, $Val extends MostplayState>
    implements $MostplayStateCopyWith<$Res> {
  _$MostplayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mostplayedlist = null,
  }) {
    return _then(_value.copyWith(
      mostplayedlist: null == mostplayedlist
          ? _value.mostplayedlist
          : mostplayedlist // ignore: cast_nullable_to_non_nullable
              as List<Musics>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MostplayStateCopyWith<$Res>
    implements $MostplayStateCopyWith<$Res> {
  factory _$$_MostplayStateCopyWith(
          _$_MostplayState value, $Res Function(_$_MostplayState) then) =
      __$$_MostplayStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Musics> mostplayedlist});
}

/// @nodoc
class __$$_MostplayStateCopyWithImpl<$Res>
    extends _$MostplayStateCopyWithImpl<$Res, _$_MostplayState>
    implements _$$_MostplayStateCopyWith<$Res> {
  __$$_MostplayStateCopyWithImpl(
      _$_MostplayState _value, $Res Function(_$_MostplayState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mostplayedlist = null,
  }) {
    return _then(_$_MostplayState(
      mostplayedlist: null == mostplayedlist
          ? _value._mostplayedlist
          : mostplayedlist // ignore: cast_nullable_to_non_nullable
              as List<Musics>,
    ));
  }
}

/// @nodoc

class _$_MostplayState implements _MostplayState {
  const _$_MostplayState({required final List<Musics> mostplayedlist})
      : _mostplayedlist = mostplayedlist;

  final List<Musics> _mostplayedlist;
  @override
  List<Musics> get mostplayedlist {
    if (_mostplayedlist is EqualUnmodifiableListView) return _mostplayedlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mostplayedlist);
  }

  @override
  String toString() {
    return 'MostplayState(mostplayedlist: $mostplayedlist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MostplayState &&
            const DeepCollectionEquality()
                .equals(other._mostplayedlist, _mostplayedlist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_mostplayedlist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MostplayStateCopyWith<_$_MostplayState> get copyWith =>
      __$$_MostplayStateCopyWithImpl<_$_MostplayState>(this, _$identity);
}

abstract class _MostplayState implements MostplayState {
  const factory _MostplayState({required final List<Musics> mostplayedlist}) =
      _$_MostplayState;

  @override
  List<Musics> get mostplayedlist;
  @override
  @JsonKey(ignore: true)
  _$$_MostplayStateCopyWith<_$_MostplayState> get copyWith =>
      throw _privateConstructorUsedError;
}
