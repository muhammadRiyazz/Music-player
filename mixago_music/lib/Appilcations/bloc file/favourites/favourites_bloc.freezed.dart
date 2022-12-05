// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavouritesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, BuildContext context) listchanging,
    required TResult Function() initiallist,
    required TResult Function(String id) iconchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, BuildContext context)? listchanging,
    TResult? Function()? initiallist,
    TResult? Function(String id)? iconchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, BuildContext context)? listchanging,
    TResult Function()? initiallist,
    TResult Function(String id)? iconchange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Listchanging value) listchanging,
    required TResult Function(Initiallist value) initiallist,
    required TResult Function(Iconchange value) iconchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Listchanging value)? listchanging,
    TResult? Function(Initiallist value)? initiallist,
    TResult? Function(Iconchange value)? iconchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Listchanging value)? listchanging,
    TResult Function(Initiallist value)? initiallist,
    TResult Function(Iconchange value)? iconchange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesEventCopyWith<$Res> {
  factory $FavouritesEventCopyWith(
          FavouritesEvent value, $Res Function(FavouritesEvent) then) =
      _$FavouritesEventCopyWithImpl<$Res, FavouritesEvent>;
}

/// @nodoc
class _$FavouritesEventCopyWithImpl<$Res, $Val extends FavouritesEvent>
    implements $FavouritesEventCopyWith<$Res> {
  _$FavouritesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ListchangingCopyWith<$Res> {
  factory _$$ListchangingCopyWith(
          _$Listchanging value, $Res Function(_$Listchanging) then) =
      __$$ListchangingCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, BuildContext context});
}

/// @nodoc
class __$$ListchangingCopyWithImpl<$Res>
    extends _$FavouritesEventCopyWithImpl<$Res, _$Listchanging>
    implements _$$ListchangingCopyWith<$Res> {
  __$$ListchangingCopyWithImpl(
      _$Listchanging _value, $Res Function(_$Listchanging) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? context = null,
  }) {
    return _then(_$Listchanging(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$Listchanging implements Listchanging {
  const _$Listchanging({required this.id, required this.context});

  @override
  final String id;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'FavouritesEvent.listchanging(id: $id, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Listchanging &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListchangingCopyWith<_$Listchanging> get copyWith =>
      __$$ListchangingCopyWithImpl<_$Listchanging>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, BuildContext context) listchanging,
    required TResult Function() initiallist,
    required TResult Function(String id) iconchange,
  }) {
    return listchanging(id, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, BuildContext context)? listchanging,
    TResult? Function()? initiallist,
    TResult? Function(String id)? iconchange,
  }) {
    return listchanging?.call(id, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, BuildContext context)? listchanging,
    TResult Function()? initiallist,
    TResult Function(String id)? iconchange,
    required TResult orElse(),
  }) {
    if (listchanging != null) {
      return listchanging(id, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Listchanging value) listchanging,
    required TResult Function(Initiallist value) initiallist,
    required TResult Function(Iconchange value) iconchange,
  }) {
    return listchanging(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Listchanging value)? listchanging,
    TResult? Function(Initiallist value)? initiallist,
    TResult? Function(Iconchange value)? iconchange,
  }) {
    return listchanging?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Listchanging value)? listchanging,
    TResult Function(Initiallist value)? initiallist,
    TResult Function(Iconchange value)? iconchange,
    required TResult orElse(),
  }) {
    if (listchanging != null) {
      return listchanging(this);
    }
    return orElse();
  }
}

abstract class Listchanging implements FavouritesEvent {
  const factory Listchanging(
      {required final String id,
      required final BuildContext context}) = _$Listchanging;

  String get id;
  BuildContext get context;
  @JsonKey(ignore: true)
  _$$ListchangingCopyWith<_$Listchanging> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitiallistCopyWith<$Res> {
  factory _$$InitiallistCopyWith(
          _$Initiallist value, $Res Function(_$Initiallist) then) =
      __$$InitiallistCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitiallistCopyWithImpl<$Res>
    extends _$FavouritesEventCopyWithImpl<$Res, _$Initiallist>
    implements _$$InitiallistCopyWith<$Res> {
  __$$InitiallistCopyWithImpl(
      _$Initiallist _value, $Res Function(_$Initiallist) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initiallist implements Initiallist {
  const _$Initiallist();

  @override
  String toString() {
    return 'FavouritesEvent.initiallist()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initiallist);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, BuildContext context) listchanging,
    required TResult Function() initiallist,
    required TResult Function(String id) iconchange,
  }) {
    return initiallist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, BuildContext context)? listchanging,
    TResult? Function()? initiallist,
    TResult? Function(String id)? iconchange,
  }) {
    return initiallist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, BuildContext context)? listchanging,
    TResult Function()? initiallist,
    TResult Function(String id)? iconchange,
    required TResult orElse(),
  }) {
    if (initiallist != null) {
      return initiallist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Listchanging value) listchanging,
    required TResult Function(Initiallist value) initiallist,
    required TResult Function(Iconchange value) iconchange,
  }) {
    return initiallist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Listchanging value)? listchanging,
    TResult? Function(Initiallist value)? initiallist,
    TResult? Function(Iconchange value)? iconchange,
  }) {
    return initiallist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Listchanging value)? listchanging,
    TResult Function(Initiallist value)? initiallist,
    TResult Function(Iconchange value)? iconchange,
    required TResult orElse(),
  }) {
    if (initiallist != null) {
      return initiallist(this);
    }
    return orElse();
  }
}

abstract class Initiallist implements FavouritesEvent {
  const factory Initiallist() = _$Initiallist;
}

/// @nodoc
abstract class _$$IconchangeCopyWith<$Res> {
  factory _$$IconchangeCopyWith(
          _$Iconchange value, $Res Function(_$Iconchange) then) =
      __$$IconchangeCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$IconchangeCopyWithImpl<$Res>
    extends _$FavouritesEventCopyWithImpl<$Res, _$Iconchange>
    implements _$$IconchangeCopyWith<$Res> {
  __$$IconchangeCopyWithImpl(
      _$Iconchange _value, $Res Function(_$Iconchange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$Iconchange(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Iconchange implements Iconchange {
  const _$Iconchange({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'FavouritesEvent.iconchange(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Iconchange &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IconchangeCopyWith<_$Iconchange> get copyWith =>
      __$$IconchangeCopyWithImpl<_$Iconchange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, BuildContext context) listchanging,
    required TResult Function() initiallist,
    required TResult Function(String id) iconchange,
  }) {
    return iconchange(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, BuildContext context)? listchanging,
    TResult? Function()? initiallist,
    TResult? Function(String id)? iconchange,
  }) {
    return iconchange?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, BuildContext context)? listchanging,
    TResult Function()? initiallist,
    TResult Function(String id)? iconchange,
    required TResult orElse(),
  }) {
    if (iconchange != null) {
      return iconchange(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Listchanging value) listchanging,
    required TResult Function(Initiallist value) initiallist,
    required TResult Function(Iconchange value) iconchange,
  }) {
    return iconchange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Listchanging value)? listchanging,
    TResult? Function(Initiallist value)? initiallist,
    TResult? Function(Iconchange value)? iconchange,
  }) {
    return iconchange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Listchanging value)? listchanging,
    TResult Function(Initiallist value)? initiallist,
    TResult Function(Iconchange value)? iconchange,
    required TResult orElse(),
  }) {
    if (iconchange != null) {
      return iconchange(this);
    }
    return orElse();
  }
}

abstract class Iconchange implements FavouritesEvent {
  const factory Iconchange({required final String id}) = _$Iconchange;

  String get id;
  @JsonKey(ignore: true)
  _$$IconchangeCopyWith<_$Iconchange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavouritesState {
  List<Musics> get favouritelist => throw _privateConstructorUsedError;
  Widget get icon => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouritesStateCopyWith<FavouritesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesStateCopyWith<$Res> {
  factory $FavouritesStateCopyWith(
          FavouritesState value, $Res Function(FavouritesState) then) =
      _$FavouritesStateCopyWithImpl<$Res, FavouritesState>;
  @useResult
  $Res call({List<Musics> favouritelist, Widget icon, String text});
}

/// @nodoc
class _$FavouritesStateCopyWithImpl<$Res, $Val extends FavouritesState>
    implements $FavouritesStateCopyWith<$Res> {
  _$FavouritesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favouritelist = null,
    Object? icon = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      favouritelist: null == favouritelist
          ? _value.favouritelist
          : favouritelist // ignore: cast_nullable_to_non_nullable
              as List<Musics>,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavouritesStateCopyWith<$Res>
    implements $FavouritesStateCopyWith<$Res> {
  factory _$$_FavouritesStateCopyWith(
          _$_FavouritesState value, $Res Function(_$_FavouritesState) then) =
      __$$_FavouritesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Musics> favouritelist, Widget icon, String text});
}

/// @nodoc
class __$$_FavouritesStateCopyWithImpl<$Res>
    extends _$FavouritesStateCopyWithImpl<$Res, _$_FavouritesState>
    implements _$$_FavouritesStateCopyWith<$Res> {
  __$$_FavouritesStateCopyWithImpl(
      _$_FavouritesState _value, $Res Function(_$_FavouritesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favouritelist = null,
    Object? icon = null,
    Object? text = null,
  }) {
    return _then(_$_FavouritesState(
      favouritelist: null == favouritelist
          ? _value._favouritelist
          : favouritelist // ignore: cast_nullable_to_non_nullable
              as List<Musics>,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FavouritesState implements _FavouritesState {
  const _$_FavouritesState(
      {required final List<Musics> favouritelist,
      required this.icon,
      required this.text})
      : _favouritelist = favouritelist;

  final List<Musics> _favouritelist;
  @override
  List<Musics> get favouritelist {
    if (_favouritelist is EqualUnmodifiableListView) return _favouritelist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favouritelist);
  }

  @override
  final Widget icon;
  @override
  final String text;

  @override
  String toString() {
    return 'FavouritesState(favouritelist: $favouritelist, icon: $icon, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouritesState &&
            const DeepCollectionEquality()
                .equals(other._favouritelist, _favouritelist) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_favouritelist), icon, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouritesStateCopyWith<_$_FavouritesState> get copyWith =>
      __$$_FavouritesStateCopyWithImpl<_$_FavouritesState>(this, _$identity);
}

abstract class _FavouritesState implements FavouritesState {
  const factory _FavouritesState(
      {required final List<Musics> favouritelist,
      required final Widget icon,
      required final String text}) = _$_FavouritesState;

  @override
  List<Musics> get favouritelist;
  @override
  Widget get icon;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_FavouritesStateCopyWith<_$_FavouritesState> get copyWith =>
      throw _privateConstructorUsedError;
}
