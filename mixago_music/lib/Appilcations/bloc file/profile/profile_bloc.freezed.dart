// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String img) changephoto,
    required TResult Function(String Photo) initialphoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String img)? changephoto,
    TResult? Function(String Photo)? initialphoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String img)? changephoto,
    TResult Function(String Photo)? initialphoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Changephoto value) changephoto,
    required TResult Function(Initialphoto value) initialphoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Changephoto value)? changephoto,
    TResult? Function(Initialphoto value)? initialphoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Changephoto value)? changephoto,
    TResult Function(Initialphoto value)? initialphoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChangephotoCopyWith<$Res> {
  factory _$$ChangephotoCopyWith(
          _$Changephoto value, $Res Function(_$Changephoto) then) =
      __$$ChangephotoCopyWithImpl<$Res>;
  @useResult
  $Res call({String img});
}

/// @nodoc
class __$$ChangephotoCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$Changephoto>
    implements _$$ChangephotoCopyWith<$Res> {
  __$$ChangephotoCopyWithImpl(
      _$Changephoto _value, $Res Function(_$Changephoto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? img = null,
  }) {
    return _then(_$Changephoto(
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Changephoto implements Changephoto {
  const _$Changephoto({required this.img});

  @override
  final String img;

  @override
  String toString() {
    return 'ProfileEvent.changephoto(img: $img)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Changephoto &&
            (identical(other.img, img) || other.img == img));
  }

  @override
  int get hashCode => Object.hash(runtimeType, img);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangephotoCopyWith<_$Changephoto> get copyWith =>
      __$$ChangephotoCopyWithImpl<_$Changephoto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String img) changephoto,
    required TResult Function(String Photo) initialphoto,
  }) {
    return changephoto(img);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String img)? changephoto,
    TResult? Function(String Photo)? initialphoto,
  }) {
    return changephoto?.call(img);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String img)? changephoto,
    TResult Function(String Photo)? initialphoto,
    required TResult orElse(),
  }) {
    if (changephoto != null) {
      return changephoto(img);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Changephoto value) changephoto,
    required TResult Function(Initialphoto value) initialphoto,
  }) {
    return changephoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Changephoto value)? changephoto,
    TResult? Function(Initialphoto value)? initialphoto,
  }) {
    return changephoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Changephoto value)? changephoto,
    TResult Function(Initialphoto value)? initialphoto,
    required TResult orElse(),
  }) {
    if (changephoto != null) {
      return changephoto(this);
    }
    return orElse();
  }
}

abstract class Changephoto implements ProfileEvent {
  const factory Changephoto({required final String img}) = _$Changephoto;

  String get img;
  @JsonKey(ignore: true)
  _$$ChangephotoCopyWith<_$Changephoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialphotoCopyWith<$Res> {
  factory _$$InitialphotoCopyWith(
          _$Initialphoto value, $Res Function(_$Initialphoto) then) =
      __$$InitialphotoCopyWithImpl<$Res>;
  @useResult
  $Res call({String Photo});
}

/// @nodoc
class __$$InitialphotoCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$Initialphoto>
    implements _$$InitialphotoCopyWith<$Res> {
  __$$InitialphotoCopyWithImpl(
      _$Initialphoto _value, $Res Function(_$Initialphoto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Photo = null,
  }) {
    return _then(_$Initialphoto(
      Photo: null == Photo
          ? _value.Photo
          : Photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Initialphoto implements Initialphoto {
  const _$Initialphoto({required this.Photo});

  @override
  final String Photo;

  @override
  String toString() {
    return 'ProfileEvent.initialphoto(Photo: $Photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initialphoto &&
            (identical(other.Photo, Photo) || other.Photo == Photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, Photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialphotoCopyWith<_$Initialphoto> get copyWith =>
      __$$InitialphotoCopyWithImpl<_$Initialphoto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String img) changephoto,
    required TResult Function(String Photo) initialphoto,
  }) {
    return initialphoto(Photo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String img)? changephoto,
    TResult? Function(String Photo)? initialphoto,
  }) {
    return initialphoto?.call(Photo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String img)? changephoto,
    TResult Function(String Photo)? initialphoto,
    required TResult orElse(),
  }) {
    if (initialphoto != null) {
      return initialphoto(Photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Changephoto value) changephoto,
    required TResult Function(Initialphoto value) initialphoto,
  }) {
    return initialphoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Changephoto value)? changephoto,
    TResult? Function(Initialphoto value)? initialphoto,
  }) {
    return initialphoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Changephoto value)? changephoto,
    TResult Function(Initialphoto value)? initialphoto,
    required TResult orElse(),
  }) {
    if (initialphoto != null) {
      return initialphoto(this);
    }
    return orElse();
  }
}

abstract class Initialphoto implements ProfileEvent {
  const factory Initialphoto({required final String Photo}) = _$Initialphoto;

  String get Photo;
  @JsonKey(ignore: true)
  _$$InitialphotoCopyWith<_$Initialphoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  String get photo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call({String photo});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$_ProfileStateCopyWith(
          _$_ProfileState value, $Res Function(_$_ProfileState) then) =
      __$$_ProfileStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String photo});
}

/// @nodoc
class __$$_ProfileStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$_ProfileState>
    implements _$$_ProfileStateCopyWith<$Res> {
  __$$_ProfileStateCopyWithImpl(
      _$_ProfileState _value, $Res Function(_$_ProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo = null,
  }) {
    return _then(_$_ProfileState(
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProfileState implements _ProfileState {
  const _$_ProfileState({required this.photo});

  @override
  final String photo;

  @override
  String toString() {
    return 'ProfileState(photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileState &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      __$$_ProfileStateCopyWithImpl<_$_ProfileState>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState({required final String photo}) = _$_ProfileState;

  @override
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileStateCopyWith<_$_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
