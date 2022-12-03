// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchtext) search,
    required TResult Function(bool textfieldbool, bool librarybool)
        visiblesearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchtext)? search,
    TResult? Function(bool textfieldbool, bool librarybool)? visiblesearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchtext)? search,
    TResult Function(bool textfieldbool, bool librarybool)? visiblesearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Search value) search,
    required TResult Function(Visiblesearch value) visiblesearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Search value)? search,
    TResult? Function(Visiblesearch value)? visiblesearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(Visiblesearch value)? visiblesearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchCopyWith<$Res> {
  factory _$$SearchCopyWith(_$Search value, $Res Function(_$Search) then) =
      __$$SearchCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchtext});
}

/// @nodoc
class __$$SearchCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$Search>
    implements _$$SearchCopyWith<$Res> {
  __$$SearchCopyWithImpl(_$Search _value, $Res Function(_$Search) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchtext = null,
  }) {
    return _then(_$Search(
      searchtext: null == searchtext
          ? _value.searchtext
          : searchtext // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Search with DiagnosticableTreeMixin implements Search {
  const _$Search({required this.searchtext});

  @override
  final String searchtext;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.search(searchtext: $searchtext)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchEvent.search'))
      ..add(DiagnosticsProperty('searchtext', searchtext));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Search &&
            (identical(other.searchtext, searchtext) ||
                other.searchtext == searchtext));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchtext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCopyWith<_$Search> get copyWith =>
      __$$SearchCopyWithImpl<_$Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchtext) search,
    required TResult Function(bool textfieldbool, bool librarybool)
        visiblesearch,
  }) {
    return search(searchtext);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchtext)? search,
    TResult? Function(bool textfieldbool, bool librarybool)? visiblesearch,
  }) {
    return search?.call(searchtext);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchtext)? search,
    TResult Function(bool textfieldbool, bool librarybool)? visiblesearch,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchtext);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Search value) search,
    required TResult Function(Visiblesearch value) visiblesearch,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Search value)? search,
    TResult? Function(Visiblesearch value)? visiblesearch,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(Visiblesearch value)? visiblesearch,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class Search implements SearchEvent {
  const factory Search({required final String searchtext}) = _$Search;

  String get searchtext;
  @JsonKey(ignore: true)
  _$$SearchCopyWith<_$Search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VisiblesearchCopyWith<$Res> {
  factory _$$VisiblesearchCopyWith(
          _$Visiblesearch value, $Res Function(_$Visiblesearch) then) =
      __$$VisiblesearchCopyWithImpl<$Res>;
  @useResult
  $Res call({bool textfieldbool, bool librarybool});
}

/// @nodoc
class __$$VisiblesearchCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$Visiblesearch>
    implements _$$VisiblesearchCopyWith<$Res> {
  __$$VisiblesearchCopyWithImpl(
      _$Visiblesearch _value, $Res Function(_$Visiblesearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textfieldbool = null,
    Object? librarybool = null,
  }) {
    return _then(_$Visiblesearch(
      textfieldbool: null == textfieldbool
          ? _value.textfieldbool
          : textfieldbool // ignore: cast_nullable_to_non_nullable
              as bool,
      librarybool: null == librarybool
          ? _value.librarybool
          : librarybool // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Visiblesearch with DiagnosticableTreeMixin implements Visiblesearch {
  const _$Visiblesearch(
      {required this.textfieldbool, required this.librarybool});

  @override
  final bool textfieldbool;
  @override
  final bool librarybool;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchEvent.visiblesearch(textfieldbool: $textfieldbool, librarybool: $librarybool)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchEvent.visiblesearch'))
      ..add(DiagnosticsProperty('textfieldbool', textfieldbool))
      ..add(DiagnosticsProperty('librarybool', librarybool));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Visiblesearch &&
            (identical(other.textfieldbool, textfieldbool) ||
                other.textfieldbool == textfieldbool) &&
            (identical(other.librarybool, librarybool) ||
                other.librarybool == librarybool));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textfieldbool, librarybool);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisiblesearchCopyWith<_$Visiblesearch> get copyWith =>
      __$$VisiblesearchCopyWithImpl<_$Visiblesearch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String searchtext) search,
    required TResult Function(bool textfieldbool, bool librarybool)
        visiblesearch,
  }) {
    return visiblesearch(textfieldbool, librarybool);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchtext)? search,
    TResult? Function(bool textfieldbool, bool librarybool)? visiblesearch,
  }) {
    return visiblesearch?.call(textfieldbool, librarybool);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchtext)? search,
    TResult Function(bool textfieldbool, bool librarybool)? visiblesearch,
    required TResult orElse(),
  }) {
    if (visiblesearch != null) {
      return visiblesearch(textfieldbool, librarybool);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Search value) search,
    required TResult Function(Visiblesearch value) visiblesearch,
  }) {
    return visiblesearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Search value)? search,
    TResult? Function(Visiblesearch value)? visiblesearch,
  }) {
    return visiblesearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Search value)? search,
    TResult Function(Visiblesearch value)? visiblesearch,
    required TResult orElse(),
  }) {
    if (visiblesearch != null) {
      return visiblesearch(this);
    }
    return orElse();
  }
}

abstract class Visiblesearch implements SearchEvent {
  const factory Visiblesearch(
      {required final bool textfieldbool,
      required final bool librarybool}) = _$Visiblesearch;

  bool get textfieldbool;
  bool get librarybool;
  @JsonKey(ignore: true)
  _$$VisiblesearchCopyWith<_$Visiblesearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  List<Musics> get songlist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call({List<Musics> songlist});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songlist = null,
  }) {
    return _then(_value.copyWith(
      songlist: null == songlist
          ? _value.songlist
          : songlist // ignore: cast_nullable_to_non_nullable
              as List<Musics>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Musics> songlist});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songlist = null,
  }) {
    return _then(_$_SearchState(
      songlist: null == songlist
          ? _value._songlist
          : songlist // ignore: cast_nullable_to_non_nullable
              as List<Musics>,
    ));
  }
}

/// @nodoc

class _$_SearchState with DiagnosticableTreeMixin implements _SearchState {
  const _$_SearchState({required final List<Musics> songlist})
      : _songlist = songlist;

  final List<Musics> _songlist;
  @override
  List<Musics> get songlist {
    if (_songlist is EqualUnmodifiableListView) return _songlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songlist);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchState(songlist: $songlist)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchState'))
      ..add(DiagnosticsProperty('songlist', songlist));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            const DeepCollectionEquality().equals(other._songlist, _songlist));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songlist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState({required final List<Musics> songlist}) =
      _$_SearchState;

  @override
  List<Musics> get songlist;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
