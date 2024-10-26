// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseBlocState<T, V> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) next,
    required TResult Function(V error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? next,
    TResult? Function(V error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? next,
    TResult Function(V error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init<T, V> value) initial,
    required TResult Function(_Loading<T, V> value) loading,
    required TResult Function(_Next<T, V> value) next,
    required TResult Function(_Error<T, V> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init<T, V> value)? initial,
    TResult? Function(_Loading<T, V> value)? loading,
    TResult? Function(_Next<T, V> value)? next,
    TResult? Function(_Error<T, V> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init<T, V> value)? initial,
    TResult Function(_Loading<T, V> value)? loading,
    TResult Function(_Next<T, V> value)? next,
    TResult Function(_Error<T, V> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseBlocStateCopyWith<T, V, $Res> {
  factory $BaseBlocStateCopyWith(
          BaseBlocState<T, V> value, $Res Function(BaseBlocState<T, V>) then) =
      _$BaseBlocStateCopyWithImpl<T, V, $Res, BaseBlocState<T, V>>;
}

/// @nodoc
class _$BaseBlocStateCopyWithImpl<T, V, $Res, $Val extends BaseBlocState<T, V>>
    implements $BaseBlocStateCopyWith<T, V, $Res> {
  _$BaseBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<T, V, $Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl<T, V> value, $Res Function(_$InitImpl<T, V>) then) =
      __$$InitImplCopyWithImpl<T, V, $Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<T, V, $Res>
    extends _$BaseBlocStateCopyWithImpl<T, V, $Res, _$InitImpl<T, V>>
    implements _$$InitImplCopyWith<T, V, $Res> {
  __$$InitImplCopyWithImpl(
      _$InitImpl<T, V> _value, $Res Function(_$InitImpl<T, V>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl<T, V> implements _Init<T, V> {
  const _$InitImpl();

  @override
  String toString() {
    return 'BaseBlocState<$T, $V>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl<T, V>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) next,
    required TResult Function(V error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? next,
    TResult? Function(V error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? next,
    TResult Function(V error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init<T, V> value) initial,
    required TResult Function(_Loading<T, V> value) loading,
    required TResult Function(_Next<T, V> value) next,
    required TResult Function(_Error<T, V> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init<T, V> value)? initial,
    TResult? Function(_Loading<T, V> value)? loading,
    TResult? Function(_Next<T, V> value)? next,
    TResult? Function(_Error<T, V> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init<T, V> value)? initial,
    TResult Function(_Loading<T, V> value)? loading,
    TResult Function(_Next<T, V> value)? next,
    TResult Function(_Error<T, V> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Init<T, V> implements BaseBlocState<T, V> {
  const factory _Init() = _$InitImpl<T, V>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, V, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T, V> value, $Res Function(_$LoadingImpl<T, V>) then) =
      __$$LoadingImplCopyWithImpl<T, V, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, V, $Res>
    extends _$BaseBlocStateCopyWithImpl<T, V, $Res, _$LoadingImpl<T, V>>
    implements _$$LoadingImplCopyWith<T, V, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T, V> _value, $Res Function(_$LoadingImpl<T, V>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl<T, V> implements _Loading<T, V> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'BaseBlocState<$T, $V>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T, V>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) next,
    required TResult Function(V error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? next,
    TResult? Function(V error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? next,
    TResult Function(V error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init<T, V> value) initial,
    required TResult Function(_Loading<T, V> value) loading,
    required TResult Function(_Next<T, V> value) next,
    required TResult Function(_Error<T, V> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init<T, V> value)? initial,
    TResult? Function(_Loading<T, V> value)? loading,
    TResult? Function(_Next<T, V> value)? next,
    TResult? Function(_Error<T, V> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init<T, V> value)? initial,
    TResult Function(_Loading<T, V> value)? loading,
    TResult Function(_Next<T, V> value)? next,
    TResult Function(_Error<T, V> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T, V> implements BaseBlocState<T, V> {
  const factory _Loading() = _$LoadingImpl<T, V>;
}

/// @nodoc
abstract class _$$NextImplCopyWith<T, V, $Res> {
  factory _$$NextImplCopyWith(
          _$NextImpl<T, V> value, $Res Function(_$NextImpl<T, V>) then) =
      __$$NextImplCopyWithImpl<T, V, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$NextImplCopyWithImpl<T, V, $Res>
    extends _$BaseBlocStateCopyWithImpl<T, V, $Res, _$NextImpl<T, V>>
    implements _$$NextImplCopyWith<T, V, $Res> {
  __$$NextImplCopyWithImpl(
      _$NextImpl<T, V> _value, $Res Function(_$NextImpl<T, V>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$NextImpl<T, V>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$NextImpl<T, V> implements _Next<T, V> {
  const _$NextImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'BaseBlocState<$T, $V>.next(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextImpl<T, V> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextImplCopyWith<T, V, _$NextImpl<T, V>> get copyWith =>
      __$$NextImplCopyWithImpl<T, V, _$NextImpl<T, V>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) next,
    required TResult Function(V error) error,
  }) {
    return next(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? next,
    TResult? Function(V error)? error,
  }) {
    return next?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? next,
    TResult Function(V error)? error,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init<T, V> value) initial,
    required TResult Function(_Loading<T, V> value) loading,
    required TResult Function(_Next<T, V> value) next,
    required TResult Function(_Error<T, V> value) error,
  }) {
    return next(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init<T, V> value)? initial,
    TResult? Function(_Loading<T, V> value)? loading,
    TResult? Function(_Next<T, V> value)? next,
    TResult? Function(_Error<T, V> value)? error,
  }) {
    return next?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init<T, V> value)? initial,
    TResult Function(_Loading<T, V> value)? loading,
    TResult Function(_Next<T, V> value)? next,
    TResult Function(_Error<T, V> value)? error,
    required TResult orElse(),
  }) {
    if (next != null) {
      return next(this);
    }
    return orElse();
  }
}

abstract class _Next<T, V> implements BaseBlocState<T, V> {
  const factory _Next(final T data) = _$NextImpl<T, V>;

  T get data;
  @JsonKey(ignore: true)
  _$$NextImplCopyWith<T, V, _$NextImpl<T, V>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, V, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T, V> value, $Res Function(_$ErrorImpl<T, V>) then) =
      __$$ErrorImplCopyWithImpl<T, V, $Res>;
  @useResult
  $Res call({V error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, V, $Res>
    extends _$BaseBlocStateCopyWithImpl<T, V, $Res, _$ErrorImpl<T, V>>
    implements _$$ErrorImplCopyWith<T, V, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T, V> _value, $Res Function(_$ErrorImpl<T, V>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ErrorImpl<T, V>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as V,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T, V> implements _Error<T, V> {
  const _$ErrorImpl(this.error);

  @override
  final V error;

  @override
  String toString() {
    return 'BaseBlocState<$T, $V>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T, V> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, V, _$ErrorImpl<T, V>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, V, _$ErrorImpl<T, V>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) next,
    required TResult Function(V error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? next,
    TResult? Function(V error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? next,
    TResult Function(V error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init<T, V> value) initial,
    required TResult Function(_Loading<T, V> value) loading,
    required TResult Function(_Next<T, V> value) next,
    required TResult Function(_Error<T, V> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init<T, V> value)? initial,
    TResult? Function(_Loading<T, V> value)? loading,
    TResult? Function(_Next<T, V> value)? next,
    TResult? Function(_Error<T, V> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init<T, V> value)? initial,
    TResult Function(_Loading<T, V> value)? loading,
    TResult Function(_Next<T, V> value)? next,
    TResult Function(_Error<T, V> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<T, V> implements BaseBlocState<T, V> {
  const factory _Error(final V error) = _$ErrorImpl<T, V>;

  V get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, V, _$ErrorImpl<T, V>> get copyWith =>
      throw _privateConstructorUsedError;
}
