import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_bloc_state.freezed.dart';

@freezed
class BaseBlocState<T, V> with _$BaseBlocState<T,V> {
  const factory BaseBlocState.initial() = _Init;
  const factory BaseBlocState.loading() = _Loading;
  const factory BaseBlocState.next(T data) = _Next<T,V>;
  const factory BaseBlocState.error(V error) = _Error<T,V>;
}